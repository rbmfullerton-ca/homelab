resource "kubernetes_secret_v1" "atlantis_terraform_secrets" {
  metadata {
    name      = "atlantis-terraform-vars"
    namespace = var.namespace
  }

  # Map your secrets to TF_VAR_ names so Terraform sees them automatically
  data = {
    "TF_VAR_authentik_token"  = var.authentik_token
    "TF_VAR_cloudflare-token" = var.cloudflare-token
    "TF_VAR_authentik_host" = var.authentik_host
    "TF_VAR_rancher_api_token" = var.rancher_api_token
    "TF_VAR_pihole1_api_token" = var.pihole1_api_token
    "TF_VAR_pihole2_api_token" = var.pihole2_api_token
    "TF_VAR_pihole3_api_token" = var.pihole3_api_token
    "TF_VAR_sonarr_api_key" = var.sonarr_api_key
    "TF_VAR_authentik_secret_key" = var.authentik_secret_key
    "TF_VAR_authentik_postgresql_password" = var.authentik_postgresql_password
    "TF_VAR_traefik-dashboard-auth" = var.traefik-dashboard-auth
    "TF_VAR_atlantis-githubAppSecret" = var.atlantis-githubAppSecret
    "TF_VAR_homarr_envs" = jsonencode(var.homarr_envs)
    "TF_VAR_jackett_envs" = jsonencode(var.jackett_envs)
    "TF_VAR_openwebui_envs" = jsonencode(var.openwebui_envs)
    "TF_VAR_pterodactyl_panel_envs" = jsonencode(var.pterodactyl_panel_envs)
    "TF_VAR_pterodactyl_database_envs" = jsonencode(var.pterodactyl_database_envs)
    "TF_VAR_bazarr_envs" = jsonencode(var.bazarr_envs)
    "TF_VAR_pihole_envs" = jsonencode(var.pihole_envs)
    "TF_VAR_pihole_envs2" = jsonencode(var.pihole_envs2)
    "TF_VAR_pihole2_envs" = jsonencode(var.pihole2_envs)
    "TF_VAR_pihole2_envs2" = jsonencode(var.pihole2_envs2)
    "TF_VAR_seerr_envs" = jsonencode(var.seerr_envs)
    "TF_VAR_sonarr_envs" = jsonencode(var.sonarr_envs)
    "TF_VAR_radarr_envs" = jsonencode(var.radarr_envs)
  }

  type = "Opaque"
}