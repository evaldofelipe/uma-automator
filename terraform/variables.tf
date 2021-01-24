# Global variables

variable "location" {
  description = "The GCP region where the resources should exist"
  default     = "us-east1-c"
}

variable "subnet_location" {
  description = "The GCP region where the subnet will be create"
  default     = "us-east1"
}

variable "project" {
  default = ""
}

variable "cidr_allowed" {
  description = "Allowed CIDR for ssh conections"
  default     = "0.0.0.0/0"
}

variable "pub_key_path" {
  description = "your ssh key inside the container"
  default     = "/home/uma/.ssh/id_rsa.pub"
}
