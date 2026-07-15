variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace for app"
  type        = string
  default     = "servarr"
}

variable "storage_size" {
  description = "Storage required for persistent volume"
  type        = string
  default     = "10Gi"
}

variable "storage_class" {
  description = "StorageClass for PVC"
  type        = string
  default     = "longhorn"
}

variable "image" {
  description = "Image for container"
  type        = string
  default     = "lscr.io/linuxserver/radarr"
}

variable "image_version" {
  description = "Version of container image"
  type        = string
  default     = "version-6.3.0.10514"
}

variable "mount_path" {
  description = "Mount Path for container's data"
  type        = string
  default     = "/config"
}

variable "mount_path2" {
  description = "Mount Path for container's data"
  type        = string
  default     = "/mnt/Movies"
}

variable "mount_path3" {
  description = "Mount Path for container's data"
  type        = string
  default     = "/mnt/Downloads"
}

variable "mount_name2" {
  description = "Mount Path for container's data"
  type        = string
  default     = "smb-movies"
}

variable "mount_name3" {
  description = "Mount Path for container's data"
  type        = string
  default     = "smb-downloads"
}


variable "port" {
  description = "Port for WebUi"
  type        = string
  default     = "7878"
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
