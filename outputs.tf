output "api_invoke_url" {
  description = "api gateway invoke url (only stage)"
  value = "${aws_apigatewayv2_stage.api.invoke_url}"
}

