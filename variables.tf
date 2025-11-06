variable "project_id" {
  description = "GCP project id"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "Machine type"
  type        = string
  default     = "e2-medium"
}

variable "gcp_credentials_file" {
  description = "Path to GCP service account JSON key (used for local runs). Jenkins will use credentials differently."
  type        = string
  default     = "terraform-jenkins-sa.json"
}
