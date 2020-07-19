output "api_invoke_url" {
  description = "api gateway invoke url (only stage)"
  value = module.http_gateway_lambda.api_invoke_url
}

output "lambda_name" {
  description = "lambda name"
  value = aws_lambda_function.lambda.function_name
}
