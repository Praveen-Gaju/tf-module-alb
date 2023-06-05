variable "env" {}
variable "tags" {}

variable "name" {}
variable "internal" {}
variable "load_balancer_type" {}
variable "subnets" {}
variable "enable_deletion_protection" {
  default = false
}
variable "vpc_id" {}
variable "allow_cidr" {}
