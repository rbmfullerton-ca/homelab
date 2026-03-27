variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
  default     = "cert-manager"
}

variable "namespace" {
  description = "Namespace for chart"
  type        = string
  default     = "cert-manager"
}

variable "repo" {
  description = "Repository of chart"
  type        = string
  default     = "https://charts.jetstack.io"
}

variable "chart" {
  description = "Chart for helm"
  type        = string
  default     = "cert-manager"
}

variable "ver" {
  description = "Version of chart"
  type        = string
  default     = "v1.20.1"
}


variable "cloudflare-token" {
  description = "The name of the app/deployment"
  type        = string
  sensitive   = true
}
