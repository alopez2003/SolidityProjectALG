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































