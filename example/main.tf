provider "aws" {  
  /* these will be provided via the execution environment */
  /* access_key = var.access_key */
  /* secret_key = var.secret_key */
  region     = var.region
}

terraform {
  required_version = "~> 0.12.28"
  required_providers {
    aws = "~> 2.68"
    random = "~> 2.3"
  }
}

module "http_gateway_lambda" {
  source = "../"

	api_name          = "example-http-gateway-for-lambda-${random_id.id.hex}"
  lambda            = aws_lambda_function.lambda

  enable_authorizer = var.api_enable_authorizer
  jwt_audience      = var.api_jwt_audience
  jwt_issuer        = var.api_jwt_issuer

  common_tags       = local.common_tags
}

resource "aws_lambda_function" "lambda" {
   function_name = "http-gateway-example-${random_id.id.hex}"
   
   filename = "build/lambda_function_payload.zip"
   source_code_hash = filebase64sha256("build/lambda_function_payload.zip")

   handler = "index.handler"
   runtime = "nodejs12.x"
   role = aws_iam_role.lambda_exec.arn

   tags = merge(local.common_tags, map("Description", "api lambda exposed via api gateway"))
}

resource "aws_iam_role" "lambda_exec" {
  name = "http-gateway-example-lambda-role-${random_id.id.hex}"
  tags = merge(local.common_tags, map("Description", "Example lambda role"))

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "lambda.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

resource "random_id" "id" {
	  byte_length = 8
}

