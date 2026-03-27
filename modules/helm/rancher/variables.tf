variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
}

variable "namespace" {
  description = "Namespace for chart"
  type        = string
  default     = "cattle-system"
}

variable "repo" {
  description = "Repository of chart"
  type        = string
  default     = "https://releases.rancher.com/server-charts/latest"
}

variable "chart" {
  description = "Chart for helm"
  type        = string
  default     = "rancher"
}

variable "ver" {
  description = "Version of chart"
  type        = string
  default     = "2.14.0"
}
