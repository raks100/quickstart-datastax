#!/bin/bash

# Usage deploy.sh stack-name key-pair

aws cloudformation validate-template \
--template-body "$(cat ./cloudformation_dse_with_autoscale.json)"

aws cloudformation create-stack \
--stack-name $1 \
--template-body "$(cat ./cloudformation_dse_with_autoscale.json)" \
--parameters \
ParameterKey=KeyName,ParameterValue=$2 \
ParameterKey=OperatorEMail,ParameterValue="donotreply@datastax.com"
