variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
}

variable "app_name2" {
  description = "The name of the app/deployment"
  type        = string
  default     = "cloudflared"
}

variable "app_split" {
  description = "The name of the app split"
  type        = string
  default     = "pihole-split"
}

variable "namespace" {
  description = "Kubernetes namespace for app"
  type        = string
  default     = "pihole"
}

variable "storage_size" {
  description = "Storage required for persistent volume"
  type        = string
  default     = "3Gi"
}

variable "storage_class" {
  description = "StorageClass for PVC"
  type        = string
  default     = "longhorn"
}

variable "image" {
  description = "Image for container"
  type        = string
  default     = "pihole/pihole"
}

variable "image_version" {
  description = "Version of container image"
  type        = string
  default     = "2026.07.1"
}

variable "image2" {
  description = "Image for container"
  type        = string
  default     = "visibilityspots/cloudflared"
}

variable "image_version2" {
  description = "Version of container image"
  type        = string
  default     = "v2026.1.2"
}

variable "mount_path" {
  description = "Mount Path for container's data"
  type        = string
  default     = "/etc/pihole"
}

variable "port" {
  description = "Port for WebUi"
  type        = string
  default     = "80"
}

variable "port2" {
  description = "Port for WebUi"
  type        = string
  default     = "53"
}

variable "port3" {
  description = "Port for WebUi"
  type        = string
  default     = "53"
}

variable "port4" {
  description = "Port for WebUi"
  type        = string
  default     = "443"
}

variable "port5" {
  description = "Port for WebUi"
  type        = string
  default     = "67"
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

# envs if required
variable "envs2" {
  description = "List of environment variables for the container"
  sensitive   = true
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
}

variable "load_balancer_ip" {
  description = "For DNS"
  type        = string
  default     = "192.168.0.155"
}


