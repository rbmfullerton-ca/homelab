variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
}

variable "traefik-dashboard-auth" {
  description = "The name of the app/deployment"
  type        = string
  sensitive   = true
}


variable "namespace" {
  description = "Namespace for chart"
  type        = string
  default     = "traefik"
}

variable "repo" {
  description = "Repository of chart"
  type        = string
  default     = "https://helm.traefik.io/traefik"
}

variable "chart" {
  description = "Chart for helm"
  type        = string
  default     = "traefik"
}

variable "ver" {
  description = "Version of chart"
  type        = string
  default     = "39.0.1"
}
