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

variable "cloudflare_token" { 
  type = string
  sensitive = true 
}