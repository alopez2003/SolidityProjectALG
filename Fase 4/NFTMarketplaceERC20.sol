// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

//import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./ico.sol";


contract NFTMarketplace is Ownable, ERC721Holder {

    address private _NFT_address;
    address private _addressOfSmartContractOfTokens;
    IERC721 items;
    ERC20 tokens;
    uint256 public _itemsForSale;

    mapping(uint256 => uint256) private _listedItemsPrice;
    mapping(uint256 => address) private _listedItemsOwner;
    //mapping(uint256 => bool) private _noFirstSale;

    event ItemListed(uint256 tokenId, address seller, uint256 price, uint256 itemsForSale);
    event ItemDelisted(uint256 tokenId, address seller, uint256 price, uint256 itemsForSale);

    event ItemSold(uint256 tokenId, address buyer, address seller, uint256 price);
    event ItemPriceUpdate(uint256 itemID, address owner, address sender, uint256 itemPrice);

    modifier onlyOwnerOrMarket(uint256 itemID) {
        require( _listedItemsOwner[itemID] == _msgSender() || owner() == _msgSender(), "Sender is not authorized.");
        _;
    }

    constructor(address nFT_address, address AddressOfSmartContractOfTokens)  Ownable(msg.sender) {
       _NFT_address = nFT_address;
       _addressOfSmartContractOfTokens = AddressOfSmartContractOfTokens;
        items = IERC721(_NFT_address);
        tokens = ERC20(_addressOfSmartContractOfTokens);
    }



    function listItem(uint256 itemID, uint256 price) external {
        require( items.ownerOf(itemID) == _msgSender(), "Only owner can list items for sale.");
        //Save NFT price & owner
        _listedItemsPrice[itemID] = price;
        _listedItemsOwner[itemID] = items.ownerOf(itemID);

        items.safeTransferFrom(_msgSender(), address(this), itemID);

        _itemsForSale++;

        emit ItemListed(itemID, _msgSender(), _listedItemsPrice[itemID], _itemsForSale);
    }


    function delistedItem(uint256 itemID) external onlyOwnerOrMarket(itemID) {

        items.safeTransferFrom(address(this), _listedItemsOwner[itemID], itemID);
        _removeSalesData(itemID);

        emit ItemDelisted(itemID, _listedItemsOwner[itemID], _listedItemsPrice[itemID], _itemsForSale);

    }

    function buyItem(uint256 itemID) external payable {
        require(_listedItemsPrice[itemID] > 0 && _listedItemsOwner[itemID] != address(0), "Item is not for sale (price =0).");

        //Check payment
        uint256 _itemPrice = _listedItemsPrice[itemID];
        require(msg.value == _itemPrice, "Price and paid amount do not watch.");

        address seller = _listedItemsOwner[itemID];
        require(seller != address(0), "Seller cannot be address 0.");

        //Send seller's amount, after fees
        (bool sentValue, ) = seller.call{value: _itemPrice}("");
        require(sentValue, "Failed to send the amount to the seller.");

        //Transfer NFT to the buyer
        items.safeTransferFrom(address(this), _msgSender(), itemID);

        //Check New Owner
        require(items.ownerOf(itemID) == _msgSender(), "New owner not assigned.");

        emit ItemSold(itemID, items.ownerOf(itemID), seller, _itemPrice);
        _removeSalesData(itemID);
    }

    function updateItemPrice(uint256 itemID, uint256 newPrice) external onlyOwnerOrMarket(itemID) {
        _listedItemsPrice[itemID] = newPrice;

        emit ItemPriceUpdate(itemID, items.ownerOf(itemID), _msgSender(), newPrice);

    }

    function _removeSalesData(uint256 itemID) internal {
        _listedItemsPrice[itemID] = 0;
        _listedItemsOwner[itemID] = address(0);
        _itemsForSale--;
    }

    function itemsForSale() external view returns(uint256) {
        return _itemsForSale;
    }

    function isItemForSale(uint256 itemID) external view returns(bool) {
        return (_listedItemsPrice[itemID] > 0 || _listedItemsOwner[itemID] == address(0));
    }

    function ownerOfItem(uint256 itemID) external view returns(address) {
        return _listedItemsOwner[itemID];
    }
    
    function itemPrice(uint256 itemID) external view returns(uint256) {
        return _listedItemsPrice[itemID];
    }
}