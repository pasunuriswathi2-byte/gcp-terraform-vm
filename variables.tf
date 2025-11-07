variable "project_id" {
  description = "terraform-vm-project-477405"
  type        = string
  default     = "terraform-vm-project-477405"
}

variable "region" {
  description = "us-east1"
  type        = string
  default     = "us-east1"
}

variable "zone" {
  description = "us-east1-a"
  type        = string
  default     = "us-east1-a"
}

variable "vm_name" {
  description = "VM0"
  type        = string
  default     = "VM0"
}

variable "machine_type" {
  description = "Machine type for the VM"
  type        = string
  default     = "e2-medium"
}

variable "ssh_user" {
  description = "Username for SSH access"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to your public SSH key"
  type        = string
}

variable "image_family" {
  description = "Image family for the VM"
  type        = string
  default     = "debian-12"
}

variable "image_project" {
  description = "Project where the image resides"
  type        = string
  default     = "debian-cloud"
}
