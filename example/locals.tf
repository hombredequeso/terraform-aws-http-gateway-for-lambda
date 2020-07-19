locals {
  common_tags = "${map(
      "Project", "terraform-aws-http-gateway-for-lambda example",
      "Infrastructure-Management", "terraform",
    )}"
}
