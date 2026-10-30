variable "app_name_uptimekuma" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_pihole" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_pihole2" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_homarr" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_jackett" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_comfyui" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_bazarr" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_bookshelf" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_request" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_traefik" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_sonarr" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_radarr" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_atlantis" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_n8n" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_chaptarr" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name_pelican_panel" {
  description = "The name of the app/deployment"
  type        = string
}

variable "client_secret_pelican_panel" {
  description = "The name of the app/deployment"
  type        = string
  sensitive   = true
}

variable "redirect_uris_pelican_panel" {
  description = "List Of Redirect URIs"
  type        = list(string)
  default     = [
    "https://pelican-panel.hozzlab.ca/auth/oauth/callback/authentik"
  ]
}

variable "app_name_openwebui" {
  description = "The name of the app/deployment"
  type        = string
}

variable "client_secret_openwebui" {
  description = "The name of the app/deployment"
  type        = string
  sensitive   = true
}

variable "redirect_uris_openwebui" {
  description = "List Of Redirect URIs"
  type        = list(string)
  default     = [
    "https://openwebui.hozzlab.ca/oauth/oidc/callback"
  ]
}