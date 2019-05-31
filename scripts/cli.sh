#!/bin/bash

#Create and join channel
export CHANNEL_NAME=demochannel
peer channel create -o orderer.india.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/india.com/orderers/orderer.india.com/msp/tlscacerts/tlsca.india.com-cert.pem

#Join peer to channel for peer0 org1
peer channel join -b demochannel.block
#Install chaincode
peer chaincode install -n democc -v 1.0 -p github.com/chaincode/mychaincode/go/

#Instantiate chaincode
peer chaincode instantiate -o orderer.india.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/india.com/orderers/orderer.india.com/msp/tlscacerts/tlsca.india.com-cert.pem -C $CHANNEL_NAME -n democc -v 1.0 -c '{"Args":["init"]}' -P "AND ('Org1MSP.peer')"

#Add New User
#peer chaincode invoke -o orderer.india.com:7050  --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/india.com/orderers/orderer.india.com/msp/tlscacerts/tlsca.india.com-cert.pem  -C $CHANNEL_NAME -n democc --peerAddresses peer0.org1.india.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.india.com/peers/peer0.org1.india.com/tls/ca.crt -c '{"Args":["createUser","Aman","aman.jain@debutinfotech.com","9876543210","phase 8b, mohali"]}'

#Add New User
#peer chaincode invoke -o orderer.india.com:7050  --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/india.com/orderers/orderer.india.com/msp/tlscacerts/tlsca.india.com-cert.pem  -C $CHANNEL_NAME -n democc --peerAddresses peer0.org1.india.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.india.com/peers/peer0.org1.india.com/tls/ca.crt -c '{"Args":["createUser","Rahul","rahul@debutinfotech.com","9876543210","phase 8b, mohali"]}'


# get user
#peer chaincode invoke -o orderer.india.com:7050  --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/india.com/orderers/orderer.india.com/msp/tlscacerts/tlsca.india.com-cert.pem  -C $CHANNEL_NAME -n democc --peerAddresses peer0.org1.india.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.india.com/peers/peer0.org1.india.com/tls/ca.crt -c '{"Args":["getUser","91a6323b10f39392d2528c6e4ba3b366694f6f539ae28a91794c902af5cf4935"]}'

# get users
#peer chaincode invoke -o orderer.india.com:7050  --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/india.com/orderers/orderer.india.com/msp/tlscacerts/tlsca.india.com-cert.pem  -C $CHANNEL_NAME -n democc --peerAddresses peer0.org1.india.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.india.com/peers/peer0.org1.india.com/tls/ca.crt -c '{"Args":["getUsers","91a6323b10f39392d2528c6e4ba3b366694f6f539ae28a91794c902af5cf4935"]}'

#add asset
#peer chaincode invoke -o orderer.india.com:7050  --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/india.com/orderers/orderer.india.com/msp/tlscacerts/tlsca.india.com-cert.pem  -C $CHANNEL_NAME -n democc --peerAddresses peer0.org1.india.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.india.com/peers/peer0.org1.india.com/tls/ca.crt -c '{"Args":["addAsset","91a6323b10f39392d2528c6e4ba3b366694f6f539ae28a91794c902af5cf4935","AML","2000"]}'


# get asset
#peer chaincode invoke -o orderer.india.com:7050  --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/india.com/orderers/orderer.india.com/msp/tlscacerts/tlsca.india.com-cert.pem  -C $CHANNEL_NAME -n democc --peerAddresses peer0.org1.india.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.india.com/peers/peer0.org1.india.com/tls/ca.crt -c '{"Args":["getAssets","91a6323b10f39392d2528c6e4ba3b366694f6f539ae28a91794c902af5cf4935"]}'


# transfer asset
#peer chaincode invoke -o orderer.india.com:7050  --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/india.com/orderers/orderer.india.com/msp/tlscacerts/tlsca.india.com-cert.pem  -C $CHANNEL_NAME -n democc --peerAddresses peer0.org1.india.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.india.com/peers/peer0.org1.india.com/tls/ca.crt -c '{"Args":["transferAsset","91a6323b10f39392d2528c6e4ba3b366694f6f539ae28a91794c902af5cf4935","bbc4a5fd605e2638706a3073676060782f6272f992aeb4fb14174d6c5757755f","AML","10"]}'
