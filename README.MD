# Blockchain ND Project 5 - Decentralized Star Notary

## Introduction

This project provides a decentralized star notary service on the Ethereum block chain, following the ERC721 standard. Users can claim a star, share a star story and sale a star to others.

This project is written in [Solidity](https://solidity.readthedocs.io/en/v0.4.24/) and with unit tests using [Truffle](https://truffleframework.com/truffle) framework.

## Deployment

This service has already been deployed on the [Rinkeby](https://rinkeby.etherscan.io/) Ethereum blockchain, the contract can be found with the following contract address or [here](https://rinkeby.etherscan.io/address/0xd9e8c1ae1cc6b588afc8381329a4c27961a7a557) on Etherscan:

```
0xd9e8c1ae1cc6b588afc8381329a4c27961a7a557
```
The contract creation transaction has is:

```
0x5e65e9052847857f9d0d14598d8e8c27b3babdf81ca357e670e339e064561a21
```

An star has been claimed with token ID `1`, and put up for sale. The star creation transaction hash is:

```
0x7285bcd6dbd87d89fc4c1456c71e432e36e2583bd3590aa94b227c83b9002639
```
The current owner of this star is:

```
0x23d4993DdB6041d0581166Bdc7d34ae7bB71C755
```

## Notary Service Client

A web based client is provided for claiming new stars as well as lookup registered stars on the Ethereum blockchain.

### Setup
This program relies on `MetaMask` and `npm` package manager. To setup the client, run the following commands in the terminal:

```shell
npm install http-server
http-server
```

Then open browser to the page [http://localhost:8080](http://localhost:8080).

You need give MetaMask permission to access your account's public information.

### Usage

#### Claim star

A new star can be claimed by a user after key in all required fields. Dec, Mag, and Cent combinations are unique identifiers of a star, thus registering the same star twice will be rejected. Token ID can be any integer number, you can check the availability of an ID using the lookup function below.

Claiming a new star requires payment for execution of the smart contract. Follow the instructions in MetaMask will guide you complete the process. A new star will be transferred to the 
new owner after successful payment.

#### Lookup star

Registered stars can be looked up using the `Lookup Star` button.