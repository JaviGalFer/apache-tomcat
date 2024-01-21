#!/bin/bash

# Nombre del stack
stack_name="TestStack"

# Nombre del archivo de plantilla YAML
template_file="main.yaml"

# Comando para desplegar el stack
aws cloudformation create-stack \
  --stack-name $stack_name \
  --template-body file://$template_file \
  --capabilities CAPABILITY_IAM \
  --region us-east-1
