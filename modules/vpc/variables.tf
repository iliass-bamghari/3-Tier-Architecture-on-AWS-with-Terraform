# pfs_vpc variables

variable "cidr_block" {
    description = "cidr global du vpc => 10.0.0.0/16"
    type = string
}

variable "tags_vpc" {
  type = map(any)
}

variable "instance_tenancy"{
    description = "type of vpc shared (default) or dedicated !"
    type = string
}
variable "enable_dns_support" {}
variable "enable_dns_hostnames" {}