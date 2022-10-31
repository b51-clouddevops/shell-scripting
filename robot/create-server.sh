#!/bin/bash 

AMI_ID="$(aws ec2 describe-images  --region us-east-1  --filters "Name=name,Values=DevOps-LabImage-CentOS7" | jq  '.Images[].ImageId' | sed -e 's/"//g')"

echo $AMI_ID

aws ec2 run-instances  --image-id ami-0abcdef1234567890 \
   
   
    --key-name MyKeyPair
