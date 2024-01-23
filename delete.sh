#!/bin/bash
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=
export AWS_DEFAULT_REGION=us-east-1


# Nombre del stack
stack_name="TestDeployStack"

# Comando para borrar el stack
aws cloudformation delete-stack \
    --stack-name $stack_name \
    --region us-east-1