variable "kube_config_path" {
  type        = string
  description = "Path to kubeconfig"
  default     = null
}

variable "authentik_host" {
  description = "Authentik host"
  type        = string
  sensitive   = true
}

variable "authentik_token" {
  description = "Authentik token"
  type        = string
  sensitive   = true
}

variable "rancher_api_token" {
  description = "Rancher API Token"
  type        = string
  sensitive   = true
}

variable "pihole1_api_token" {
  description = "pihole1 token"
  type        = string
  sensitive   = true
}

variable "pihole2_api_token" {
  description = "pihole2 token"
  type        = string
  sensitive   = true
}

variable "pihole3_api_token" {
  description = "Pihole3 token"
  type        = string
  sensitive   = true
}

variable "uptimekuma" {
  description = "App name"
  type        = string
  default     = "uptimekuma"
}

variable "pihole" {
  description = "App name"
  type        = string
  default     = "pihole"
}

variable "comfyui" {
  description = "App name"
  type        = string
  default     = "comfyui"
}

variable "pihole2" {
  description = "App name"
  type        = string
  default     = "pihole2"
}

variable "homarr" {
  description = "App name"
  type        = string
  default     = "homarr"
}

variable "jackett" {
  description = "App name"
  type        = string
  default     = "jackett"
}


variable "homarr_envs" {
  description = "Environment variables for Homarr container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "jackett_envs" {
  description = "Environment variables for Jackett container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}


variable "openwebui" {
  description = "App name"
  type        = string
  default     = "openwebui"
}

variable "openwebui_envs" {
  description = "Environment variables for container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "pterodactyl_panel" {
  description = "App name"
  type        = string
  default     = "pterodactyl-panel"
}

variable "pterodactyl_database" {
  description = "App name"
  type        = string
  default     = "pterodactyl-database"
}

variable "pterodactyl_cache" {
  description = "App name"
  type        = string
  default     = "pterodactyl-cache"
}

variable "pterodactyl_panel_envs" {
  description = "Environment variables for container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "pterodactyl_database_envs" {
  description = "Environment variables for container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "bazarr" {
  description = "App name"
  type        = string
  default     = "bazarr"
}

variable "bazarr_envs" {
  description = "Environment variables for Bazarr container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "bookshelf" {
  description = "App name"
  type        = string
  default     = "bookshelf"
}

variable "bookshelf_envs" {
  description = "Environment variables for Bookshelf container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "request" {
  description = "App name"
  type        = string
  default     = "request"
}

variable "sonarr_api_key" {
  description = "sonarr api key"
  type        = string
  sensitive   = true
}

variable "pihole_envs" {
  description = "Environment variables for pihole container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "pihole_envs2" {
  description = "More environment variables for pihole container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "pihole2_envs" {
  description = "Environment variables for pihole2 container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "pihole2_envs2" {
  description = "More environment variables for pihole2 container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "seerr" {
  description = "App name"
  type        = string
  default     = "seerr"
}


variable "seerr_envs" {
  description = "Environment variables for Homarr container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "sonarr" {
  description = "App name"
  type        = string
  default     = "sonarr"
}

variable "sonarr_envs" {
  description = "Environment variables for Bazarr container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "radarr" {
  description = "App name"
  type        = string
  default     = "radarr"
}

variable "authentik" {
  description = "App name"
  type        = string
  default     = "authentik"
}

variable "rancher" {
  description = "App name"
  type        = string
  default     = "rancher"
}

variable "traefik" {
  description = "App name"
  type        = string
  default     = "traefik"
}

variable "atlantis" {
  description = "App name"
  type        = string
  default     = "atlantis"
}

variable "radarr_envs" {
  description = "Environment variables for Bazarr container"
  sensitive   = true
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "authentik_secret_key" {
  description = "Authentik secret key"
  type        = string
  sensitive   = true
}

variable "authentik_postgresql_password" {
  description = "Authentik postgresql password"
  type        = string
  sensitive   = true
}

variable "traefik-dashboard-auth" {
  description = "traefik dashboard secret"
  type        = string
  sensitive   = true
}

variable "cloudflare-token" {
  description = "Cloudflair api token"
  type        = string
  sensitive   = true
}

variable "atlantis-githubAppSecret" {
  description = "Atlantis github app secret"
  type        = string
  sensitive   = true
}


