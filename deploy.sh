#!/bin/bash
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=
export AWS_DEFAULT_REGION=us-east-1

# Nombre del stack
stack_name="TestDeployStack"

# Nombre del archivo de plantilla YAML
template_file="main.yml"

# Comando para desplegar el stack
aws cloudformation deploy \
  --stack-name $stack_name \
  --template-file $template_file \
  --capabilities CAPABILITY_NAMED_IAM \
  --region us-east-1
