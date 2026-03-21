variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
}

variable "namespace" {
  description = "Namespace for chart"
  type        = string
  default     = "atlantis"
}

variable "repo" {
  description = "Repository of chart"
  type        = string
  default     = "https://runatlantis.github.io/helm-charts"
}

variable "chart" {
  description = "Chart for helm"
  type        = string
  default     = "atlantis"
}

variable "ver" {
  description = "Version of chart"
  type        = string
  default     = "6.1.0"
}

variable "storageClass" {
  description = "Storage class for persistence"
  type        = string
  default     = "longhorn"
}

variable "port" {
  description = "Port For Web UI"
  type        = string
  default     = "80"
}

variable "githubAppID" {
  description = "App ID"
  type        = string
  default     = "3149605"
}

variable "githubAppSecret" {
  description = "App Secret"
  type        = string
  sensitive   = true
}

variable "authentik_token" { 
  type = string
  sensitive = true 
}

variable "cloudflare-token" { 
  type = string
  sensitive = true 
}

variable "authentik_host" { 
  type = string
  sensitive = true 
}

variable "rancher_api_token" { 
  type = string
  sensitive = true 
}

variable "pihole1_api_token" { 
  type = string
  sensitive = true 
}

variable "pihole2_api_token" { 
  type = string
  sensitive = true 
}

variable "pihole3_api_token" { 
  type = string
  sensitive = true 
}

variable "sonarr_api_key" { 
  type = string
  sensitive = true 
}

variable "authentik_secret_key" { 
  type = string
  sensitive = true 
}

variable "authentik_postgresql_password" { 
  type = string
  sensitive = true 
}

variable "traefik-dashboard-auth" { 
  type = string
  sensitive = true 
}

variable "atlantis-githubAppSecret" { 
  type = string
  sensitive = true 
}

variable "homarr_envs" { 
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
  sensitive = true 
}

variable "jackett_envs" { 
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
  sensitive = true 
}

variable "openwebui_envs" { 
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
  sensitive = true 
}

variable "pterodactyl_panel_envs" { 
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
  sensitive = true 
}

variable "pterodactyl_database_envs" { 
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
  sensitive = true 
}

variable "bazarr_envs" { 
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
  sensitive = true 
}

variable "pihole_envs" { 
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
  sensitive = true 
}

variable "pihole_envs2" { 
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
  sensitive = true 
}

variable "pihole2_envs" { 
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
  sensitive = true 
}

variable "pihole2_envs2" { 
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
  sensitive = true 
}

variable "seerr_envs" { 
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
  sensitive = true 
}

variable "sonarr_envs" { 
  sensitive = true 
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
}

variable "radarr_envs" { 
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
  sensitive = true 
}