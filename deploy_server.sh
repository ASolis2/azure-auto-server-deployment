#!/bin/bash

# Variables
RESOURCE_GROUP="AutoRG2"
LOCATION="eastus"
VNET_NAME="AutoVNet"
SUBNET_NAME="AutoSubnet"
VM_NAME="AutoVM"
ADMIN_USER="solis"
ADMIN_PASSWORD="OmniGreen24?!?!"

# Create resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create virtual network and subnet
az network vnet create --name $VNET_NAME --resource-group $RESOURCE_GROUP --subnet-name $SUBNET_NAME

# Create virtual machine
az vm create \
  --resource-group $RESOURCE_GROUP \
  --name $VM_NAME \
  --image Ubuntu2204 \
  --admin-username $ADMIN_USER \
  --admin-password $ADMIN_PASSWORD \
  --vnet-name $VNET_NAME \
  --subnet $SUBNET_NAME \
  --public-ip-sku Standard\
  --size Standard_B1s \
 

# Open port 80 (HTTP) to allow web traffic
az vm open-port --port 80 --resource-group $RESOURCE_GROUP --name $VM_NAME

echo "Deployment Complete!"
