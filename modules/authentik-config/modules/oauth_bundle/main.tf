terraform {
  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "~> 2026.8.0" # or latest
    }
  }
}

data "authentik_property_mapping_provider_scope" "scopes" {
  managed_list = [
    "goauthentik.io/providers/oauth2/scope-openid",
    "goauthentik.io/providers/oauth2/scope-email",
    "goauthentik.io/providers/oauth2/scope-profile"
  ]
}

# Data Sources
data "authentik_flow" "default-authorization-flow" {
  slug = "default-provider-authorization-explicit-consent"
}

data "authentik_flow" "default_invalidation_flow" {
  slug = "default-provider-invalidation-flow"
}

data "authentik_flow" "request_authentication_flow" {
  slug = "request-authentication"
}

data "authentik_group" "homelab" {
  name = "HomeLab"
}

resource "authentik_provider_oauth2" "name" {
  name               =  var.app_slug
  client_id          =  var.app_slug
  client_type      = var.client_type
  client_secret         = var.client_secret
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  invalidation_flow = data.authentik_flow.default_invalidation_flow.id
  authentication_flow = data.authentik_flow.request_authentication_flow.id
  access_token_validity = var.token_validity
  sub_mode                   = "user_username"
  include_claims_in_id_token = true
  property_mappings = data.authentik_property_mapping_provider_scope.scopes.ids
  signing_key = var.signing_key
  grant_types = var.grant_types
  allowed_redirect_uris = [
    for uri in var.redirect_uris : {
      matching_mode = "strict"
      url           = uri
      redirect_uri_type = "authorization"
    }
  ]
}

resource "authentik_application" "name" {
  name              = var.app_name
  slug              = var.app_slug
  protocol_provider = authentik_provider_oauth2.name.id
  group             = var.app_group
}

resource "authentik_application_entitlement" "homelab_ent" {
  application = authentik_application.name.uuid
  name       = "homelab-access"
}

resource "authentik_policy_binding" "restrict_app_to_ent" {
  target = authentik_application.name.uuid
  policy = var.require_homelab_ent_policy_id
  order  = 1
}

resource "authentik_policy_binding" "homelab_ent_group_binding" {
  target = authentik_application_entitlement.homelab_ent.id
  group  = data.authentik_group.homelab.id
  order  = 0
}

# Outputs
output "oauth2_id" {
  value = authentik_provider_oauth2.name.id
}

output "application_id" {
  value = authentik_application.name.id
}

output "policy_group_id" {
  value = authentik_policy_binding.restrict_app_to_ent.id
}