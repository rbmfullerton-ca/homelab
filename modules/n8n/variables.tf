variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace for app"
  type        = string
  default     = "n8n"
}

variable "storage_size" {
  description = "Storage required for persistent volume"
  type        = string
  default     = "5Gi"
}

variable "storage_class" {
  description = "StorageClass for PVC"
  type        = string
  default     = "longhorn"
}

variable "image" {
  description = "Image for container"
  type        = string
  default     = "docker.n8n.io/n8nio/n8n"
}

variable "image_version" {
  description = "Version of container image"
  type        = string
  default     = "2.37.1"
}

variable "mount_path" {
  description = "Mount Path for container's data"
  type        = string
  default     = "/home/node/.n8n"
}

variable "port" {
  description = "Port for WebUi"
  type        = string
  default     = "5678"
}

variable "protocol" {
  description = "Protocol for WebUi"
  type        = string
  default     = "TCP"
}


# envs if required
variable "envs" {
  description = "List of environment variables for the container"
  sensitive   = true
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
}
