#!/bin/bash

#Create and join channel
export CHANNEL_NAME=demochannel
export CHANECODE_VERSION=1.4

#Install chaincode
peer chaincode install -n democc -v $CHANECODE_VERSION -p github.com/chaincode/mychaincode/go/

#Instantiate chaincode
peer chaincode upgrade -o orderer.india.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/india.com/orderers/orderer.india.com/msp/tlscacerts/tlsca.india.com-cert.pem -C $CHANNEL_NAME -n democc -v $CHANECODE_VERSION -c '{"Args":["init"]}' -P "AND ('Org1MSP.peer')"
