# Creación de un Marketplace de NFT's por Alberto López Gutiérrez (Proyecto de fin de curso)

De verdad este curso fue un paradigma para mi, inclusive desde que me inscribí al Master puesto que yo no soy desarrollador, a pesar de tener como formación una Ingeniería en Cibernética, no me he dedicado a este rubro y es a la materia que más le tenía miedo. Muchas gracias por el conocimiento compartido.

NOTA: Desde que inicié este master, no ha existido un grupo, siempre hemos entregado mis compañeros y yo el trabajo de forma individual, me parece que sólo ha habido un grupo. En mi caso continuaré con la entrega individual. Muchas gracias!!

## Proyecto Global

El presente será el caso de uso derivado de los sprints anteriores, lo estaré haciendo en Hardhat, sin embargo mi experiencia es que no pude verificar el código una vez compilado y desplegado el smart contract. Estaré subiendo las capturas de pantalla conforme a lo que estaré desarrollando.

De inicio el caso de uso será el despliegue de una Memecoin denominada Chilango que tendrá añadidos NFT's del mismo token, esto lo haremos sobre la red de BNB en Testnet.

## Fase 1. Desarrollar un Smart Contract de introducción y lectura de datos, dentro de un proyecto Truffle o Hardhat, con despliegue configurado.

Comencemos por el despliegue de Hardhat en la máquina donde estamos haciendo este trabajo, que es una máquina virtual con Ubuntu 22.04 LTS

Instalamos Node.js

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/74b4e63e-4474-4262-90c9-c3bf39372d33)

Instalamos NPM

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/a2e9a0fd-54f5-4bf2-8b08-60ffe6a01804)

Actualizamos el NPM

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/bb7bba1e-3baf-4cd7-a30a-b55ee0bd8e7e)

ya con eso instalamos Hardhat

Después de editar el archivo .env de Hardhat con la nueva address que vamos a ocupar para este fin comenzaremos a trabajar. Cabe mencionar que ya se había configurado este archivo con otra address que ocupamos anteriormente.

Realizamos el "npm install"

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/b8e4e533-cde1-4220-9e62-54a4f4eab713)

Posteriormente el "npx hardhat clean"

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/a6788aec-02d6-4c7c-87fb-4e97ec1e16e4)

Y posteriormente el compile con "npx hardhat compile"

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/49c8c2ed-6357-4511-a7eb-c07b3a958c9c)



Y tendremos inicialmente un Smart Contract llamado Notarization.sol, el mismo que usaremos de pruebas, en el Sprint 1 lo hicimos sobre la red de Goerli, en esta ocasión lo haremos sobre la red BNB Smart Chain. **Este archivo se podrá encontrar en este mismo Github dentro de la documentación de Fase 1**

Ejecutamos "npx hardhat run ./script/deploy.tx -network binance_bsc_testnet" una vez preconfigurado mi archivo .env con la clave privada de mi wallet y nos da una confirmación de que fue desplegado el contrato

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/d5c18dd0-e600-4db1-a433-157517b2399f)

Podemos verificar que esto fue desplegado correctamente en el bscscan

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/d8fa9910-2dfb-4cf5-8f62-78dc05b4a0b3)

Se anexa el URL de la transacción:
TX: https://testnet.bscscan.com/tx/0xafeb18620254eaa5be74fe1504a17819bfe815463124d5e05626b5ad9f356747
Contrato: https://testnet.bscscan.com/address/0x03f7335b3ec99a61ec9a5aa32d1e6e321fd27a8a

Al momento de querer verificarlo con Hardhat, nos muestra que ha sido verificado

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/7cfdbb13-a4aa-47cd-899a-fa11e851088f)

Interactuando un poco para pruebas, vamos a revisar en el testnet de bscscan que el owner es mi address 0xC3ae535bd149b7B69BF17bab03F9F5733C779A36, esto conectando nuestro MetaMask al contrato

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/8b03b769-8047-4769-9888-1200bbb301f7)

Al igual, vamos a hacer una funcion de write, para registrar un nuevo hash con la palabra ALGPrueba y nos pide confirmación en MetaMask

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/bd0b5746-5d41-46c1-bd76-3164d9010724)

Y vemos que se ejecutó sin problema, se anexa screenshot y URL de transacción

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/a64f2acc-e6db-4703-ae2b-e423a87ecece)

URL
https://testnet.bscscan.com/tx/0xae38bb19ebfeccd582b5ed2e6679ab857bf4f07df5c767120032e02aba20bfb3

Podemos ver que en la dirección del contrato ya tenemos un registo "register"

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/2f982fe5-064d-4225-8d25-d6957644646c)

Ahora consultemos en el contrato el hash ALGPueba y nos devuelve un Timestamping

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/d2140655-9659-4a5c-aa73-0f05b39c754e)


Si vamos a epochconverter.com vemos que fue de hace unos minutos

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/0d167130-f6d7-4820-abbb-bfac4f574149)

Preguntas de reflexión:

**¿Por qué has usado Truffle o Hardhat, respectivamente?**
No he usado Truffle, he usado Hardhat y Remix, por lo que entiendo Hardhat es una de las nuevas tendencias para el despliegue de contratos inteligentes.
Algo que me ha gustado es que se puede compilar de forma muy rápida todos los contratos de una sola pasada, sin necesidad de estar compilando uno por uno, la ventaja sobre esto es que si existen errores, Hardhat te dice en que archivo se encuentra el problema, pero de una te compila todos en caso de estar bien.

**¿Has tenido problemas? ¿Cuáles?**
Tuve problemas para la ejecución de Hardhat al inicio, por lo que veo está muy ligado a los nodos, es necesario hacer un buen clean y en caso de desplegar errores, borrar tanto los nodos como probablemente los artifacts, que hacen mucha referencia entre los archivos de Hardhat.
Por otra cuestión, y lo voy a verificar en la fase 2 y 3, con Hardhat al momento de hacer un Flattener, al momento de intentar verificar los contratos no me dejaba, es por eso que lo hacía con Remix, pero seguiremos viendo como avanza el proyecto.


_Fin de Fase 1_

## Fase 2: Desarrollar y desplegar una criptomoneda, basada en el estándar ERC-20 (primer Smart Contract) y un segundo Smart Contract que reciba tokens nativos de la red (ETH) y envíe un número de criptomonedas a cambio (como una ICO). 

Utilizando el mismo punto de Hardhat, lo que vamos a hacer es inicializar un token llamado Chilango, esto como un Memecoin sólo para despliegue de un contato. Sólo por referencia, se les dice Chilangos a la gente de vivimos en Ciudad de México. Usualmente el término Chilango es denominado a la gente que es foranea a Ciudad de México y se va a vivir a Ciudad de México, sin embargo hoy en día, cualquiera que viva en Ciudad de México se le denomina Chilango.

Lo primero que hacemos es verificamos que tengamos los contratos en la carpeta "contracts", estos archivos estarán disponibles en la Fase 2 de este Github. Nos referimos a los contratos ico.sol y dex.sol.

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/a1d95fed-efa8-4783-8693-d02d49cd3166)

Posteriormente hacemos un clean (npx hardhat clean) y un compile (npx hardhat compile) para ver que todo esté bien.

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/1650fe71-c677-46d4-889a-f77cf79e04ff)

Y posteriormente desplegamos.

### Initial Coin Offering

En el caso de la Initial Coin Offering para el token CHIL sera con el archivo deployico.ts

Vemos que se ha desplegado con el contrato: 0x8b74E88C04CC2866f95DA7EEBfAAB74e1010dDD6 hace unos pocos segundos

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/5666b6e3-5986-404c-a1eb-dab5d8292f9a)

URL del contrato: https://testnet.bscscan.com/address/0x8b74E88C04CC2866f95DA7EEBfAAB74e1010dDD6

Si vemos el código está aún en bytecode, por lo que es necesario verificarlo

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/3c8d4fb7-f0cc-4d2e-87b2-0d10bc9b0760)

Ejecutamos el comando "npx hardhat verify --network binance_bsc_testnet 0x8b74E88C04CC2866f95DA7EEBfAAB74e1010dDD6" y satisfactoriamente verifica el contrato, ya no se ve en bytecode

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/7e6e724d-991e-4a5f-8fe6-235f4592963a)

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/2abf0d62-7244-41fe-9e42-6eca8617d523)

Podemos ver el código e interactuar con él en la siguiente liga:

https://testnet.bscscan.com/address/0x8b74E88C04CC2866f95DA7EEBfAAB74e1010dDD6#code

Consultamos el balance del token CHIL en la cuenta

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/f3087623-e2f5-4608-be55-344157b1c7c4)

Y también importamos el token en MetaMask para poder ser visualizado

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/5e8dbe15-8309-4200-a6c6-bc0f6bbe33a8)

Y vemos que tenemos 10,000,000 de tokens CHIL

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/67727b52-c7fb-4741-88cc-9bd7290cddfd)

Ahora vamos a incrementar otro millon de tokens, entonces lo que hacemos es calcular esto en Gweis y nos dará lo siguiente:

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/ad1794e0-6603-4453-952c-14aafff28667)

Será lo que establezcamos en la función del contrato conectado a nuestro MetaMask

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/4957bc3b-6130-477f-9a9d-597c9662758d)

Nos pide confirmación en MetaMask

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/d484dbf5-9e27-4bb7-a6ff-0ccbd99bad9f)

Y podemos ver que la transacción se ejecutó hace unos segundos:

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/f3a89813-42f1-4e07-95be-70dab8ab7219)

Se anexa URL de la transacción

https://testnet.bscscan.com/tx/0x9e26f2bd1cc1f96db51c9316783a6720b42fabb5de97d105e7aac62b59905458

Por error puse Wei's en lugar de Gwei's y me salió una cantidad muy fuerte, pero a fines de ejemplo pudimos ver como se minteaban nuevos tokens

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/5c8fab29-cc8b-4b3c-a7fa-884df65b43fc)

### Descentralized Exchange

Ahora vamos a desplegar un contrato inteligente que nos permita hacer las ventas de estos tokens CHILL en un tipo Descentralized Exchange (DEX), por lo que haremos deploy del contrato dex.sol

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/c92b6db4-fe63-43e9-9952-7d0d2a213843)

Vemos que se desplegó en el contrato 0xae503eb22eA6F5415B60Ebb39eaeC5606caF72A5 y que se creó aproximadamente hace un minuto

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/ff08c0c1-d85a-44e7-a4f3-f017b749d5c9)

Dirección URL del contrato

https://testnet.bscscan.com/address/0xae503eb22eA6F5415B60Ebb39eaeC5606caF72A5

Ahora verificamos el código con "npx hardhat verify --network binance_bsc_testnet 0xae503eb22eA6F5415B60Ebb39eaeC5606caF72A5 "0x8b74E88C04CC2866f95DA7EEBfAAB74e1010dDD6" y podemos ver que fue satisfactorio

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/b69730bc-6610-4563-964a-a983df328e9b)

Ahora ya podemos ver el código verificado e interactuar con las funciones

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/fd4dca18-2faf-4393-8c6c-466cd613f733)

Liga del codigo del contrato y sus funciones

https://testnet.bscscan.com/address/0xae503eb22eA6F5415B60Ebb39eaeC5606caF72A5#code

Ahora lo primero es poner en venta unos CHIL, pero para esto primero debemos aprobar el contrato dex en nuestro contrato ico, para que pueda ser utilizado, para esto regresamos al smart contract ico y en la función de escritura approve vamos a colocar la dirección del smart contract 0xae503eb22eA6F5415B60Ebb39eaeC5606caF72A5 por un monto de 1,000,000 de CHIL, por lo que hacemos la conversión en eth-converter.com

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/4e7ae2fd-e76b-4b25-8edb-324f524cf696)


Pide confirmación de Metamask

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/b99414e5-02dd-42b4-8d2c-a8b6aae1e154)

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/ca5298d9-3caf-42d6-a2f7-56b57a3864fd)

Y vemos que fue aprobada

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/8717c5ec-485b-4540-bf98-e1fb81c602ac)

URL de la transacción
https://testnet.bscscan.com/tx/0x0503aa2654812677affbcae9e1f3e6541090b098e5e8ff8e80ac5ccdc1ab300f

Ahora vamos a transferir el 1,000,000 de tokens al contrato desde nuestro MetaMask

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/0c825473-62cb-448a-b51a-58c846ad17d4)

Pide confirmación

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/8e459f67-6792-4cd0-ac6e-d789ced30683)

Y podemos ver que fue ejecutado

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/f8d63bdc-4a11-4c6b-8d26-74d05accf7be)

Dirección de transacción
https://testnet.bscscan.com/tx/0x02a89755bb723964d2e9b4dded9d78b12a368a8c91a62800b8bc2a00794716df

Podemos ver que ahora el contrato tiene 1,000,000 de tokens de CHIL

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/f5baf1a9-7e54-4383-88d6-ce56c8f27b3d)

Ahora vamos a ejecutar la función de compra "buy" de 0.01 BNB

Me pide confirmación en MetaMask

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/dd7a936e-08e4-45da-a127-12f9505bf761)

Y puedo ver que con eso pude comprar un token de CHIL

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/fb53f5a8-dbe2-4512-80f5-ab9ff3812c26)

Se anexa URL de la transacción

https://testnet.bscscan.com/tx/0xe65197d3a522a406c6c7e6efe53114faa121f4c03d280c18fd92c2cb966500de

Y ahora probamos la función de venta "sell" derivado de la función del ICO "approve" por 500,000 Gwei de CHIL

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/e94cf156-6f0b-4e5b-b81a-e0ae16d3f659)

Nos pide confirmación en MetaMask

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/e5d831f1-c31d-4511-acc2-5c298d3f700c)

Y listo, vemos que fue ejecutada la función hace poco tiempo

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/29da9d74-ffa7-4c9f-bb2c-de31fafc133a)

URL de la transacción

https://testnet.bscscan.com/tx/0x4440c1324f352ce996c3238ff38e78e603b5af33079ac0c4b357f90ab233dc68


Preguntas de Reflexión:

¿Qué caso de uso pretende resolver tu criptomoneda y el resto de Smart Contracts programados?
Realmente está pensada como una memecoin, que si a bien en este momento están en auge, puesto que en mercado alcista, las personas se dejan llevar por emociones, sin decir que les gusta comprar cualquier tipo de moneda, y en específico una memecoin que tiene logos atractivos. Pero con esto, este tipo de tokens pueden ser minteados sin un limite de supply chain (que es lo que permite resolver el contrato ico.sol), por lo que se pueden mintear cuantos tokens se quieran de este tipo de monedas, y así mismo pueden ser intercambiados, ya sea en compra o venta y muchas veces esto es hecho en un exchange descentralizado, por lo que el smart contract dex, permite comercializar este tipo de tokens.
Algo interesante de este contrato (dex.sol) es que permite vender si y solo si está aprobada la dirección a la que se va a vender y por una cantidad fija, por lo que no cualquiera podría emitir un contrato de venta. Esto añade una capa de seguridad al smart contract para que no cualquiera pueda ejecutar esta función, a menos de que esté autorizado a realizarlo.

¿Qué valor añadido aporta esta criptomoneda, y el resto de Smart Contracts programados, a otros casos similares existentes?
Es muy común el ver este tipo de criptomonedas, y realmente no existe una utilidad de la misma que no sea el poseer tokens de esta índole, sin embargo su comportamiento es igual al resto de las criptomonedas en el aspecto de la comercialización (compra/venta), por lo que es necesario tener contratos que permitan estos pasos.

¿Cómo crees que puede mejorarse técnicamente?
En verdad, me parece que la quema de tokens es algo muy interesante, en este caso no está programada, y aunque si es posible hacerlo, no se programó. Otra cosa, no como mejora, sino como autoreflexión y derivado del sprint 3, es que no había aprendido como verificar los contratos por medio de hardhat, y realmente es mucho más sencillo que con Remix, por tanto este es un punto adicional de porque ocupar Hardhat como compilador, es muy eficiente.


_Fin de la Fase 2._


## Fase 3: Desarrollar y desplegar 2 Smart Contracts base de NFTs, implementando el estándar ERC-721 y el ERC-1155. 

Esta fase, derivada del Sprint 3, se desplegará en Hardhat puesto que me parece que ya tengo el conocimiento de como desplegar los contratos y sobre todo verificarlos.

Primero comencemos verificando que tenemos los contratos y los scripts de ejecución para desplegarlos.

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/a14f5c8d-c07f-4513-9750-67e2cbec0b42)

### My NFT

Comencemos con el despliegue del contrato MyNFT, que nos permitirá acuñar nuestro primer NFT

Para eso hacemos un "npx hardhat clean" y un "npx hardhat compile" de inicio, tuvo algunos warnings, pero aún así compilamos

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/e5d1f32c-9cb1-4de1-8b52-d007858eed3b)

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/80bb4fb4-86ea-4156-b6f2-cf93d7872d40)

Comencemos con el despliegue de MyNFT.sol

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/9915def0-b359-46ea-a401-521b15ba88dd)

Vemos que se despliega en el contrato 0xFde1850bEDEa42da1755131cD13eC342dd678c7d y que fue desplegado hace unos cuantos segundos

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/9f084599-b324-40c9-8ca5-ebefa4823da7)

URL del Contrato
https://testnet.bscscan.com/address/0xFde1850bEDEa42da1755131cD13eC342dd678c7d

Vemos que el contrato está en bytecode, por lo que procedemos a verificarlo

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/60487cdc-7bab-4155-afd8-46266e0da6fb)

Ejecutamos "npx hardhat verify --network binance_bsc_testnet 0xFde1850bEDEa42da1755131cD13eC342dd678c7d

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/9f427932-7038-4250-8f69-383fd038317f)
![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/6a8f891f-7844-49af-9398-5b0bb2ee9ee8)

Podemos ver que ahora el contrato está verificado y disponible para uso de sus funciones de lectura y escritura

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/4340d4a1-e5ac-43c7-9c03-3cc28dea276d)

Liga al Codigo del contrato
https://testnet.bscscan.com/address/0xFde1850bEDEa42da1755131cD13eC342dd678c7d#code

Lo que hacemos primero es mintear un primer NFT con la función de escritura "awardItem" conectando MetaMask

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/ecb18340-c9cd-4045-8a45-0d4d0ce221d0)

Nos pide confirmación en MetaMask

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/d3822757-7d9d-48a9-a822-d6946d4dbf4f)

Y vemos que la transacción ha sido ejecutada hace unos pocos segundos

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/845b9bfa-281b-42c6-8352-4416a9da1ab3)

URL de la transaccion
https://testnet.bscscan.com/tx/0xb7385a833d4a6182e7ffa90d2862026c7b7feb2d4924d89c25600d83fb57ef82

Podemos ver ahora en las funciones de lectura que fue minteado el tokenURI CHILANGO1 con tokenId 0 hacia mi address 0xC3ae535bd149b7B69BF17bab03F9F5733C779A36

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/ddbe9248-b8ef-4f73-ad9d-5c5940f5244f)

### Marketplace

Ahora despleguemos el contrato inteligente de NFTMarketplace.sol, para esto tuvimos que editar el archivo de despliegue estableciendo la dirección del contrato del minteo de NFT's

Realizamos el despliegue del script

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/161d575a-0788-43be-b986-faee46f0d196)

Vemos que se desplego hacia el contrato hace unos pocos segundos

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/bc416711-d8d4-421e-a303-b210871ca412)

URL del contrato
https://testnet.bscscan.com/address/0xbe09536578A6CEa7320DC35C70D79883c7042C14

Verificamos el contrato y podemos ver que ya fue verificado

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/cb165a45-258e-4683-9437-538137a32729)

Podemos interactuar ya con las funciones del contrato

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/aad06733-e86d-4c6e-b447-bab705fa8cae)

URL del código del contrato
https://testnet.bscscan.com/address/0xbe09536578A6CEa7320DC35C70D79883c7042C14#code

Lo primero que haremos es poner en venta el NFT con tokenID 0 en 10,000,000 Gweis

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/2a59baa5-fc6d-41f6-aee8-191e8ec63249)

Nos pide confirmación de MetaMask

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/e9393e68-9b2b-4b2d-b5a4-705ebd3092f5)

y se queda en pending, me parece que esto es por la forma en la que se desplegó el contrato, en un inicio tuve un error y el deploy de MyNFT lo hice con MarketPlace, por lo que lo hice con la dirección de mi address, puesto que no tenía una dirección de un SmartContract de minteo de nuevos NFT's, lo que haré es deplegar este contrato en conjunto con un ERC-20 en una nueva cuenta para dar pase a la Fase 4 y con esto comprobar la Fase 3, pero podemos ver que el contrato fue desplegado con éxito.

Preguntas de Reflexión

**¿Qué caso de uso pretende resolver tu caso de uso basado en criptomonedas y NFT?**
Tal cual fue en la Fase 2, esto vino de una Memecoin la cual tiene NFT's que pueden ser intercambiadas, vendidas y compradas, mismas que deben tener una aprobación por parte de una address o addresses específicas.

**¿Qué valor añadido puede aportar sobre otros proyectos existentes?**
Realmente, al ser una NFT de Memecoin, el valor realmente es el intercambio de un token no fungible que puede ser coleccionable esperando en un futuro pueda ser rentable.

**¿Cómo crees que puede mejorarse técnicamente?**
Desde luego que de muchas formas, de inicio, tal cual como la fase 2, no existe un burn, pero también en este caso, tuve un error de despliegue, mismo que pretendo arreglar en la Fase 4, desplegando el contrato de ICO, DEX, MyNFT y NFTMarketplace en otra cuenta para ligar ICO con NFTMarketplace.

_Fin de la Fase 3._

## Fase 4.

Aún estoy en investigación de cómo poder pagar con la moneda CHIL el NFT desarrollado y promocionado en el Marketplace, ya pude ver que es posible llamar el contrato ico.sol dentro del contrato Marketplace.ico, ahora estoy viendo como integrar esto en el código para que pueda ser pagado de esta forma.

Update, en verdad estuve intentando revisar como integrar el ERC20 dentro del ERC721, sin embargo no tuve éxito, el código que me compila lo subo en la carpeta Fase 4.

Lo realizado hasta ahora es:

- Mandar llamar el contrato del Initial Coin Offering (CHIL) desde los imports

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/ec8d8cc8-85a7-4c68-a99c-9c57ddacef5e)

- Realizar nuevas variables para almacenar el contrato del ICO, mismos que serán llamados desde el constructor

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/c5324abf-5f80-42d1-a1a9-a9125a0138ad)

- Mandar llamar en el constructor a este smart contract y asociar los addresses correctos, así como en la declaración inicial ocupar la variable "tokens" para poder manipularla con los precios

![image](https://github.com/alopez2003/SolidityProjectALG/assets/67942268/7c9ef52e-18f5-42de-ad97-ce215e425d05)


Mi desconocimiento está en poder llamar la función listItem para usar en vez de la variable items, llamar tokens, el error de compilación me marca en que no puede llamar esto por ERC20, que es una función ERC721, mi problema de desconocimiento está en poder hacer que este NFT, que está en interfase ERC721, pueda ser llamado para ser pagado con la variable tokens, que está en ERC20

Estuve apoyandome de diversos foros, sin embargo no se acoplaban mucho al caso de uso, el que más se acerco fue el github de [NickVanzo.](https://github.com/NickVanzo/Contracts_For_Thesis)

Estuve consultando también los siguientes enlaces:
[https://github.com/fulldecent/spend-ERC20-create-ERC721](https://github.com/fulldecent/spend-ERC20-create-ERC721)
[https://ethereum.stackexchange.com/questions/112301/is-this-possible-to-pay-for-erc721-token-with-erc20-token-not-eth](https://ethereum.stackexchange.com/questions/112301/is-this-possible-to-pay-for-erc721-token-with-erc20-token-not-eth)

Entiendo que el objetivo no fue logrado, agradecería un ejemplo de como se hace para complementar mi aprendizaje.

Agradezco de antemano el conocimiento otorgado y gracias por el módulo Alex.

Alberto López Gutiérrez.








































































 





























