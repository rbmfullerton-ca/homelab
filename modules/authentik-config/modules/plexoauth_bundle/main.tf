terraform {
  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "~> 2025.12.0" # or latest
    }
  }
}

# Create a proxy provider
data "authentik_flow" "default-authorization-flow" {
  slug = "default-provider-authorization-explicit-consent"
}

data "authentik_flow" "default_invalidation_flow" {
  slug = "default-provider-invalidation-flow"
}

data "authentik_flow" "request_authentication_flow" {
  slug = "request-authentication"
}

resource "authentik_provider_proxy" "name" {
  name               =  var.app_slug
  mode               = "forward_single"
  external_host      = var.app_external_host
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  invalidation_flow = data.authentik_flow.default_invalidation_flow.id
  authentication_flow = data.authentik_flow.request_authentication_flow.id
  access_token_validity = var.token_validity
}

resource "authentik_application" "name" {
  name              = var.app_name
  slug              = var.app_slug
  protocol_provider = authentik_provider_proxy.name.id
}

# Outputs
output "proxy_id" {
  value = authentik_provider_proxy.name.id
}

output "application_id" {
  value = authentik_application.name.id
}
