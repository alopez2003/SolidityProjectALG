// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ico is ERC20 {
    constructor() ERC20("Chilango Token", "CHIL") {
        _mint(msg.sender, 10000000000000000000000000);
    }

    function mint(uint256 amount) external {
        _mint(msg.sender, amount * 10 * 18);
    }
}
