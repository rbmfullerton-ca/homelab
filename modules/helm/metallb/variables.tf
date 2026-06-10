variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
  default     = "metallb"
}

variable "namespace" {
  description = "Namespace for chart"
  type        = string
  default     = "metallb-system"
}

variable "repo" {
  description = "Repository of chart"
  type        = string
  default     = "https://metallb.github.io/metallb"
}

variable "chart" {
  description = "Chart for helm"
  type        = string
  default     = "metallb"
}

variable "ver" {
  description = "Version of chart"
  type        = string
  default     = "0.16.1"
}
