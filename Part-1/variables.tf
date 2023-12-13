variable "instance_family_image" {
  description = "Instance image"
  type        = string
  default     = "ubuntu-1804-lts"
}

variable "ssh_credentials" {
  description = "Credentials for connect to instances"
  type        = object({
    user        = string
    private_key = string
    pub_key     = string
  })
  default     = {
    user        = "ubuntu"
    private_key = "~/.ssh/id_rsa"
    pub_key     = "~/.ssh/id_rsa.pub"
  }
}