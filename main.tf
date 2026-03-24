terraform {
  backend "kubernetes" {
    secret_suffix    = "atlantis-homelab-state"
    namespace        = "atlantis"
    config_path   = null
  }
}

module "authentik" {
  source = "./modules/authentik-config"
  app_name_uptimekuma = var.uptimekuma
  app_name_pihole = var.pihole
  app_name_pihole2 = var.pihole2
  app_name_homarr = var.homarr
  app_name_jackett = var.jackett
  app_name_openwebui = var.openwebui
  app_name_comfyui = var.comfyui
  app_name_bazarr = var.bazarr
  app_name_bookshelf = var.bookshelf
  app_name_traefik = var.traefik
  app_name_sonarr = var.sonarr
  app_name_radarr = var.radarr
  app_name_request = var.request
  app_name_atlantis = var.atlantis
  # optionally, pass variables expected by your module here
}

module "storage" {
  source = "./modules/storage"
}

module "uptimekuma" {
  source = "./modules/uptimekuma"
  app_name = var.uptimekuma
  # optionally, pass variables expected by your module here
}

module "pihole" {
  source = "./modules/pihole-config"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
  app_name_uptimekuma = var.uptimekuma
  app_name_pihole = var.pihole
  app_name_pihole2 = var.pihole2
  app_name_homarr = var.homarr
  app_name_jackett = var.jackett
  app_name_openwebui = var.openwebui
  app_name_comfyui = var.comfyui
  app_name_bazarr = var.bazarr
  app_name_bookshelf = var.bookshelf
  app_name_traefik = var.traefik
  app_name_sonarr = var.sonarr
  app_name_radarr = var.radarr
  app_name_seerr = var.seerr
  app_name_request = var.request
  app_name_authentik = var.authentik
  app_name_rancher = var.rancher
  app_name_atlantis = var.atlantis
  app_name_pterodactyl_panel = var.pterodactyl_panel
  # optionally, pass variables expected by your module here
}

module "homarr" {
  source = "./modules/homarr"
  app_name = var.homarr
  envs = var.homarr_envs
}

module "jackett" {
  source = "./modules/jackett"
  app_name = var.jackett
  envs = var.jackett_envs
}

module "ai" {
  source = "./modules/ai"
}

module "ollama" {
  source = "./modules/ai/ollama"
}

module "automatic1111" {
  source = "./modules/ai/automatic1111"
}

module "comfyui" {
  source = "./modules/ai/comfyui"
}

module "openwebui" {
  source = "./modules/ai/openwebui"
  app_name = var.openwebui
  envs = var.openwebui_envs
}

module "pterodactyl_panel" {
  source = "./modules/pterodactyl/panel"
  app_name = var.pterodactyl_panel
  envs = var.pterodactyl_panel_envs
}

module "pterodactyl_database" {
  source = "./modules/pterodactyl/database"
  app_name = var.pterodactyl_database
  envs = var.pterodactyl_database_envs
}

module "pterodactyl_cache" {
  source = "./modules/pterodactyl/cache"
  app_name = var.pterodactyl_cache
}

module "bazarr" {
  source = "./modules/bazarr"
  app_name = var.bazarr
  envs = var.bazarr_envs
}

module "bookshelf" {
  source = "./modules/bookshelf"
  app_name = var.bookshelf
  envs = var.bookshelf_envs
}

module "cronjobs" {
  source = "./modules/cronjobs"
  sonarr_api_key = var.sonarr_api_key
}

module "pihole-app" {
  source = "./modules/pihole"
  app_name = var.pihole
  envs = var.pihole_envs
  envs2 = var.pihole_envs2
}

module "pihole2-app" {
  source = "./modules/pihole2"
  app_name = var.pihole2
  envs = var.pihole2_envs
  envs2 = var.pihole2_envs2
}

module "seerr" {
  source = "./modules/seerr"
  app_name = var.seerr
  envs = var.seerr_envs
}

module "sonarr" {
  source = "./modules/sonarr"
  app_name = var.sonarr
  envs = var.sonarr_envs
}

module "radarr" {
  source = "./modules/radarr"
  app_name = var.radarr
  envs = var.radarr_envs
}

module "authentik-helm" {
  source = "./modules/helm/authentik"
  app_name = var.authentik
  authentik_secret_key = var.authentik_secret_key
  authentik_postgresql_password = var.authentik_postgresql_password
}

module "rancher-helm" {
  source = "./modules/helm/rancher"
  app_name = var.rancher
}

module "traefik-helm" {
  source = "./modules/helm/traefik"
  app_name = var.traefik
  traefik-dashboard-auth = var.traefik-dashboard-auth
}

module "cert-manager-helm" {
  source = "./modules/helm/cert-manager"
  cloudflare-token = var.cloudflare-token
}

module "relaoder-helm" {
  source = "./modules/helm/reloader"
}

module "atlantis-helm" {
  source = "./modules/helm/atlantis"
  githubAppSecret = var.atlantis-githubAppSecret
  app_name = var.atlantis
  authentik_token  = var.authentik_token
  cloudflare-token = var.cloudflare-token
  authentik_host = var.authentik_host
  rancher_api_token = var.rancher_api_token
  pihole1_api_token = var.pihole1_api_token
  pihole2_api_token = var.pihole2_api_token
  pihole3_api_token = var.pihole3_api_token
  sonarr_api_key = var.sonarr_api_key
  authentik_secret_key = var.authentik_secret_key
  authentik_postgresql_password = var.authentik_postgresql_password
  traefik-dashboard-auth = var.traefik-dashboard-auth
  atlantis-githubAppSecret = var.atlantis-githubAppSecret
  homarr_envs = var.homarr_envs
  jackett_envs = var.jackett_envs
  openwebui_envs = var.openwebui_envs
  pterodactyl_panel_envs = var.pterodactyl_panel_envs
  pterodactyl_database_envs = var.pterodactyl_database_envs
  bazarr_envs = var.bazarr_envs
  pihole_envs = var.pihole_envs
  pihole_envs2 = var.pihole_envs2
  pihole2_envs = var.pihole2_envs
  pihole2_envs2 = var.pihole2_envs2
  seerr_envs = var.seerr_envs
  sonarr_envs = var.sonarr_envs
  radarr_envs = var.radarr_envs
}