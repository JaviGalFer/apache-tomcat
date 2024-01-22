#!/bin/bash
export AWS_ACCESS_KEY_ID=ASIARO3OAYUUDHIKWFFU
export AWS_SECRET_ACCESS_KEY=L8TG6JGsTnAUxEznsS7lDOwXGdi0wEYsrON1AUiY
export AWS_SESSION_TOKEN=FwoGZXIvYXdzEKL//////////wEaDG0zQdAO6Sc8Ln2qJiLJAWgTBsTuFD6y2wYCkl8b+R5BKBrOFzFNsieG9AzCl4wo1tRud5S/1iZk+JgckMSNG8TadpnoMAzgz2XFiZEvBiDTbW+BFopF6/mqTVSukCD/PSTxDgUDua1iGB7ltWmquNMn5NwMVf8spSf1NrimAJ/OXM/cTjuZtyRAk9cDZ2hHoBVIbD+/CB6dxFQDeQj/ua2Mn9OcXmsMopy5ZMAeu7yFc1ejBeTeBlf1+mRu/1ljQAkvHZyxtoOtZsi91qYfD3tpNyeEqMOI8SiZtLqtBjItUF6htwMERYGXWDCOOL2WfgnxCRY+95+ZfslNrBcOmXJj8Zawgw/AA6q7d647
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
