variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
}

variable "namespace" {
  description = "Namespace for chart"
  type        = string
  default     = "authentik"
}

variable "repo" {
  description = "Repository of chart"
  type        = string
  default     = "https://charts.goauthentik.io"
}

variable "chart" {
  description = "Chart for helm"
  type        = string
  default     = "authentik"
}

variable "ver" {
  description = "Version of chart"
  type        = string
  default     = "2026.8.0"
}

variable "authentik_secret_key" {
  description = "Secret key for Authentik"
  type        = string
  sensitive   = true
}

variable "authentik_postgresql_password" {
  description = "Password for PostgreSQL"
  type        = string
  sensitive   = true
}

variable "storageClass" {
  description = "Storage class for persistence"
  type        = string
  default     = "longhorn"
}
