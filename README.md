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



Y tendremos inicialmente un Smart Contract llamado Notarization.sol, el mismo que usaremos de pruebas, en el Sprint 1 lo hicimos sobre la red de Goerli, en esta ocasión lo haremos sobre la red BNB Smart Chain







