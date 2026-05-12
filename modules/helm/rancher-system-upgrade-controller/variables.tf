variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
  default     = "system-upgrade-controller"
}

variable "namespace" {
  description = "Namespace for chart"
  type        = string
  default     = "cattle-system"
}

variable "repo" {
  description = "Repository of chart"
  type        = string
  default     = "https://charts.rancher.io"
}

variable "chart" {
  description = "Chart for helm"
  type        = string
  default     = "system-upgrade-controller"
}

variable "ver" {
  description = "Version of chart"
  type        = string
  default     = "109.0.1"
}
