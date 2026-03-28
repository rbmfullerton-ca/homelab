variable "app_name" {
  description = "The name of the app/deployment"
  type        = string
  default     = "csi-smb-driver"
}

variable "namespace" {
  description = "Namespace for chart"
  type        = string
  default     = "kube-system"
}

variable "repo" {
  description = "Repository of chart"
  type        = string
  default     = "https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/charts"
}

variable "chart" {
  description = "Chart for helm"
  type        = string
  default     = "csi-driver-smb"
}

variable "ver" {
  description = "Version of chart"
  type        = string
  default     = "1.20.1"
}
