#!/bin/bash

apt update -y && apt upgrade -y && apt auto-remove -y

apt install awscli -y

export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=
export AWS_DEFAULT_REGION=us-east-1

# Nombre del stack
stack_name=TestDeployStack

# Nombre del archivo de plantilla YAML
template_file=ubuntu.yml

# Tipo de instancia
ec2_instance_type=t2.micro

# Comando para desplegar el stack
aws cloudformation deploy \
  --stack-name $stack_name \
  --template-file $template_file \
  --capabilities CAPABILITY_NAMED_IAM \
  --no-fail-on-empty-changeset \
  --region us-east-1 \
  --parameter-override InstanceType=$ec2_instance_type
