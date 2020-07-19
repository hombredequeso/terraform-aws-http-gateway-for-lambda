Terraform AWS Http Gateway for Lambda

This project is a terraform module. It constructs the infrastructure for an Http Gateway for a lambda.
The general principle for this api-gateway is to have a very simple api. It forwards all routes through the one lambda; it only has a single stage. Essentially the only embellishment is that it allows for a JWT authorizer to be used.

The example/ directory contains a basic sample.
