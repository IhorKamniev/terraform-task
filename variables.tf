#-------storage variables--------
variable "aws_region" {}
variable "project_name" {}

#-------networking variables--------
variable "vpc_cidr" {}
variable "public_cidrs" {
  type = "list"
}
variable "private_cidrs" {
  type = "list"
}

#-------compute variables--------

variable "key_name" {}

variable "public_key_path" {}

variable "server_instance_type" {}

variable "instance_count" {
  default = 1
}
