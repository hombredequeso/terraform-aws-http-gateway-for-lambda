

# HTTP API
resource "aws_apigatewayv2_api" "api" {
	name          = var.api_name
	protocol_type = "HTTP"
  description   = "lamba + auth0 project"

  tags = merge(var.common_tags, map("Summary", "api gateway with auth0 passing everything through to lambda"))
}

resource "aws_apigatewayv2_stage" "api" {
  api_id = aws_apigatewayv2_api.api.id
  name   = "api"
  auto_deploy = "true"
  description = "sole environment"
}

resource "aws_apigatewayv2_route" "api_all" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "$default"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_example.id}"

  authorization_type = var.enable_authorizer? "JWT" : "NONE"
  authorizer_id = var.enable_authorizer? aws_apigatewayv2_authorizer.apigw_auth[0].id : ""
}

resource "aws_apigatewayv2_integration" "lambda_example" {
  api_id           = aws_apigatewayv2_api.api.id
  integration_type = "AWS_PROXY"

  description               = "lambda integration"
  integration_method        = "POST"
  integration_uri           = var.lambda.invoke_arn
  payload_format_version    = "2.0"
}

# Permission of the api gateway to invoke a lambda
resource "aws_lambda_permission" "apigw" {
	action        = "lambda:InvokeFunction"
	function_name = var.lambda.arn
	principal     = "apigateway.amazonaws.com"

	source_arn = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}

resource "aws_apigatewayv2_authorizer" "apigw_auth" {
  count            = var.enable_authorizer ? 1 : 0
  api_id           = aws_apigatewayv2_api.api.id
  authorizer_type  = "JWT"
  identity_sources = ["$request.header.Authorization"]
  name             = "${aws_apigatewayv2_api.api.name}-authorizer"

  jwt_configuration {
    audience = var.jwt_audience
    issuer   = var.jwt_issuer
  }
}
