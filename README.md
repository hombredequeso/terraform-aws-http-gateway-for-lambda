Terraform AWS Http Gateway for Lambda

This project is a terraform module. It constructs the infrastructure for an Http Gateway for a lambda.
The general principle for this api-gateway is to have a very simple api. It forwards all routes through the one lambda; it only has a single stage. Essentially the only embellishment is that it allows for a JWT authorizer to be used.

The example/ directory contains a basic sample.

# References

[Serverless Applications with AWS Lambda and API Gateway](https://learn.hashicorp.com/terraform/aws/lambda-api-gateway)
Uses the REST api gateway, but the first part about the lambda is directly relevant.

[How to use the aws_apigatewayv2_api to add an HTTP API to a Lambda function](https://advancedweb.hu/how-to-use-the-aws-apigatewayv2-api-to-add-an-http-api-to-a-lambda-function/)

[Securing AWS HTTP APIs with JWT Authorizers](https://auth0.com/blog/securing-aws-http-apis-with-jwt-authorizers/)
