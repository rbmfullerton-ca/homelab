variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace for app"
  type        = string
  default     = "pterodactyl"
}

variable "storage_size" {
  description = "Storage required for persistent volume"
  type        = string
  default     = "2Gi"
}

variable "storage_class" {
  description = "StorageClass for PVC"
  type        = string
  default     = "longhorn"
}

variable "image" {
  description = "Image for container"
  type        = string
  default     = "mariadb"
}

variable "image_version" {
  description = "Version of container image"
  type        = string
  default     = "12.2"
}

variable "mount_path" {
  description = "Mount Path for container's data"
  type        = string
  default     = "/var/lib/mysql"
}

variable "port" {
  description = "Port"
  type        = string
  default     = "3306"
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
