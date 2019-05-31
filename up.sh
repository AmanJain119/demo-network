#!/bin/bash

#Generate certificates
#cryptogen generate --config=crypto-config.yaml
# export FABRIC_CFG_PATH=$PWD
# #Create Channel Artifacts
# #Genesis Block
# configtxgen -profile OrgOrdererGenesis -channelID demo-sys-channel -outputBlock ./channel-artifacts/genesis.block

# #Channel.tx
# export CHANNEL_NAME=demochannel  && configtxgen -profile OrgChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME

# #Org1AnchorPeer.tx
# configtxgen -profile OrgChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP

#Network Up
docker-compose -f ./docker-compose-cli.yaml up -d

sleep 5  # Wait for 5 seconds.
echo "Continuing ...."

#Move to cli container
docker exec -it cli bash


