variable "region" {}
variable "vpc_cidr" {}
variable "subnets" {
  type = list(object({
    name       = string
    cidr_block = string
    type       = string  
  }))
  description = "List of subnets with their names, CIDRs, and types."
}
