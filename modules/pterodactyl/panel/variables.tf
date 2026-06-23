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
  default     = "ghcr.io/pterodactyl/panel"
}

variable "image_version" {
  description = "Version of container image"
  type        = string
  default     = "v1.14.0"
}

variable "mount_path" {
  description = "Mount Path for container's data"
  type        = string
  default     = "/app/var/"
}

variable "mount_path2" {
  description = "Mount Path for container's data"
  type        = string
  default     = "/etc/nginx/http.d/"
}

variable "mount_path3" {
  description = "Mount Path for container's data"
  type        = string
  default     = "/etc/letsencrypt/"
}

variable "mount_path4" {
  description = "Mount Path for container's data"
  type        = string
  default     = "/app/storage/logs"
}

variable "port" {
  description = "Port for WebUi"
  type        = string
  default     = "80"
}

variable "port2" {
  description = "Port for WebUi"
  type        = string
  default     = "443"
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
