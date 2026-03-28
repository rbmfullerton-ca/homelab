variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
  default     = "longhorn"
}

variable "namespace" {
  description = "Namespace for chart"
  type        = string
  default     = "longhorn-system"
}

variable "repo" {
  description = "Repository of chart"
  type        = string
  default     = "https://charts.longhorn.io"
}

variable "chart" {
  description = "Chart for helm"
  type        = string
  default     = "longhorn"
}

variable "ver" {
  description = "Version of chart"
  type        = string
  default     = "1.10.2"
}
