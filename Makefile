TFLAGS=-var-file=prod.tfvars

apply:
	terraform apply ${TFLAGS}
plan:
	terraform plan ${TFLAGS}
make:
	terraform make ${TFLAGS}
destroy:
	terraform destroy ${TFLAGS}

