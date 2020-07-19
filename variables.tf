variable api_name {
  description = "Name of the api gateway"
}

variable lambda {
  description = "Name of the lambda the api gateway will invoke"
}

variable common_tags {
  description = "Tags to add to resources"
  type = map(string)
}

variable jwt_issuer {
  description = "The jwt issuer. For example: https://dev-xxxxx.au.auth0.com/"
  default = ""
}

variable jwt_audience {
  description = "Audiences allowed by the api_jwt_issuer"
  type = list(string)
  default = []
}

variable enable_authorizer {
  description = "Enable authorizer or not. If enabled, also set jwt_issuer and jwt_audience"
  type = bool
  default = false
}
