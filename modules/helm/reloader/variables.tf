variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
  default     = "reloader"
}

variable "namespace" {
  description = "Namespace for chart"
  type        = string
  default     = "atlantis"
}

variable "repo" {
  description = "Repository of chart"
  type        = string
  default     = "https://stakater.github.io/stakater-charts"
}

variable "chart" {
  description = "Chart for helm"
  type        = string
  default     = "reloader"
}

variable "ver" {
  description = "Version of chart"
  type        = string
  default     = "2.2.9"
}
