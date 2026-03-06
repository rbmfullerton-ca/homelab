terraform {
  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "~> 2025.12.0" # or latest
    }
  }
}

# Shared config

# Declare policy expressions
resource "authentik_policy_expression" "require_homelab_ent" {
  name       = "require-homelab-entitlement"
  expression = <<EOT
return ak_is_group_member(request.user, name="HomeLab")
EOT
}

output "all_proxies" {
  value = [
    module.uptimekuma.proxy_id,
    module.pihole.proxy_id,
    module.pihole2.proxy_id
  ]
}

resource "authentik_outpost" "outpost" {
  name               = "Apps"
  protocol_providers = [
    module.uptimekuma.proxy_id,
    module.homarr.proxy_id,
    module.openwebui.proxy_id,
    module.pihole.proxy_id,
    module.pihole2.proxy_id,
    module.jackett.proxy_id,
    module.bazarr.proxy_id,
    module.bookshelf.proxy_id,
    module.request.proxy_id,
    module.traefik.proxy_id,
    module.sonarr.proxy_id,
    module.radarr.proxy_id,
    module.comfyui.proxy_id
  ]
  service_connection = authentik_service_connection_kubernetes.local.id
}

resource "authentik_service_connection_kubernetes" "local" {
  name  = "local-k3s"
  local = true
}

# Do modules here. Don’t forget to add them to the outpost.
module uptimekuma {
  source = "./modules/forwardauth_bundle"
  app_name = var.app_name_uptimekuma
  app_slug = var.app_name_uptimekuma
  app_external_host = "https://${var.app_name_uptimekuma}.hozzlab.ca"
  require_homelab_ent_policy_id = authentik_policy_expression.require_homelab_ent.id
  token_validity = "hours=10"
}

module homarr {
  source = "./modules/forwardauth_bundle"
  app_name = var.app_name_homarr
  app_slug = var.app_name_homarr
  app_external_host = "https://${var.app_name_homarr}.hozzlab.ca"
  require_homelab_ent_policy_id = authentik_policy_expression.require_homelab_ent.id
  token_validity = "hours=10"
}

module jackett {
  source = "./modules/forwardauth_bundle"
  app_name = var.app_name_jackett
  app_slug = var.app_name_jackett
  app_external_host = "https://${var.app_name_jackett}.hozzlab.ca"
  require_homelab_ent_policy_id = authentik_policy_expression.require_homelab_ent.id
  token_validity = "hours=10"
}


module openwebui {
  source = "./modules/forwardauth_bundle"
  app_name = var.app_name_openwebui
  app_slug = var.app_name_openwebui
  app_external_host = "https://${var.app_name_openwebui}.hozzlab.ca"
  require_homelab_ent_policy_id = authentik_policy_expression.require_homelab_ent.id
  token_validity = "hours=10"
}

module pihole {
  source = "./modules/forwardauth_bundle"
  app_name = var.app_name_pihole
  app_slug = var.app_name_pihole
  app_external_host = "https://${var.app_name_pihole}.hozzlab.ca"
  require_homelab_ent_policy_id = authentik_policy_expression.require_homelab_ent.id
  token_validity = "hours=10"
}

module pihole2 {
  source = "./modules/forwardauth_bundle"
  app_name = var.app_name_pihole2
  app_slug = var.app_name_pihole2
  app_external_host = "https://${var.app_name_pihole2}.hozzlab.ca"
  require_homelab_ent_policy_id = authentik_policy_expression.require_homelab_ent.id
  token_validity = "hours=10"
}

module comfyui {
  source = "./modules/forwardauth_bundle"
  app_name = var.app_name_comfyui
  app_slug = var.app_name_comfyui
  app_external_host = "https://${var.app_name_comfyui}.hozzlab.ca"
  require_homelab_ent_policy_id = authentik_policy_expression.require_homelab_ent.id
  token_validity = "hours=10"
}

module bazarr {
  source = "./modules/forwardauth_bundle"
  app_name = var.app_name_bazarr
  app_slug = var.app_name_bazarr
  app_external_host = "https://${var.app_name_bazarr}.hozzlab.ca"
  require_homelab_ent_policy_id = authentik_policy_expression.require_homelab_ent.id
  token_validity = "hours=10"
}

module bookshelf {
  source = "./modules/forwardauth_bundle"
  app_name = var.app_name_bookshelf
  app_slug = var.app_name_bookshelf
  app_external_host = "https://${var.app_name_bookshelf}.hozzlab.ca"
  require_homelab_ent_policy_id = authentik_policy_expression.require_homelab_ent.id
  token_validity = "hours=10"
}

module traefik {
  source = "./modules/forwardauth_bundle"
  app_name = var.app_name_traefik
  app_slug = var.app_name_traefik
  app_external_host = "https://${var.app_name_traefik}.hozzlab.ca"
  require_homelab_ent_policy_id = authentik_policy_expression.require_homelab_ent.id
  token_validity = "hours=10"
}

module sonarr {
  source = "./modules/forwardauth_bundle"
  app_name = var.app_name_sonarr
  app_slug = var.app_name_sonarr
  app_external_host = "https://${var.app_name_sonarr}.hozzlab.ca"
  require_homelab_ent_policy_id = authentik_policy_expression.require_homelab_ent.id
  token_validity = "hours=10"
}

module radarr {
  source = "./modules/forwardauth_bundle"
  app_name = var.app_name_radarr
  app_slug = var.app_name_radarr
  app_external_host = "https://${var.app_name_radarr}.hozzlab.ca"
  require_homelab_ent_policy_id = authentik_policy_expression.require_homelab_ent.id
  token_validity = "hours=10"
}

module request {
  source = "./modules/plexoauth_bundle"
  app_name = var.app_name_request
  app_slug = var.app_name_request
  app_external_host = "https://${var.app_name_request}.hozzlab.ca"
  token_validity = "hours=24"
}


