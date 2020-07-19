variable region {
  description = "AWS region of deployment"
  default = "ap-southeast-2"
}

variable api_enable_authorizer {
  description = "Enable authorizer or not. If enabled, also set api_jwt_issuer and api_jwt_audience"
  type = bool
  default = false
}

variable api_jwt_issuer {
  description = "The jwt issuer. For example: https://dev-xxxxx.au.auth0.com/"
  default = ""
}

variable api_jwt_audience {
  description = "Audiences allowed by the api_jwt_issuer"
  type = list(string)
  default = []
}
