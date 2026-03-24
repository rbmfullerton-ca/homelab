variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace for app"
  type        = string
  default     = "pterodactyl"
}

variable "image" {
  description = "Image for container"
  type        = string
  default     = "redis"
}

variable "image_version" {
  description = "Version of container image"
  type        = string
  default     = "8.6.2-alpine"
}

variable "port" {
  description = "Port"
  type        = string
  default     = "6379"
}

variable "protocol" {
  description = "Protocol for WebUi"
  type        = string
  default     = "TCP"
}