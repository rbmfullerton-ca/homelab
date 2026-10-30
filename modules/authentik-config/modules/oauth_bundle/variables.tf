variable "app_name" {
  type = string
  description = "Human friendly application name."
}

variable "app_slug" {
  type = string
  description = "Machine friendly application name."
}

variable "app_group" {
  default = "HomeLab"
  description = "Group to assign the application to. {Optional}"
}

variable "require_homelab_ent_policy_id" {}

variable "redirect_uris" {
  type        = list(string)
  description = "Allowed OAuth2 redirect/callback URIs"
}

variable "client_type" {
  type        = string
  default     = "confidential"
  description = "OAuth2 client type: 'confidential' or 'public'"
}

variable "token_validity" {
  type = string
  description = "token validity time"
}

variable "client_secret" {
  type        = string
  sensitive   = true
  description = "Custom OAuth2 Client Secret"
}

variable "signing_key" {
  type    = string
  default = null
}