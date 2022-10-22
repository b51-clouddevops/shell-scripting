#!/bin/bash 
set -e 

COMPONENT=catalogue

source components/common.sh

echo -n "Installing Ngnix:"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash