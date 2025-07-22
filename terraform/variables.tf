variable "ami" {
  description = "Ubuntu-ami for app-server"
  type = string
  default = "ami-05f991c49d264708f"
}

variable "instance_type" {
  description = "Instance type for app-server is t2.micro"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "Create new SSH key"
  type = string
  default = "app-server"
}