# global variables

variable "region" {
  type = string
}

# variable "username" {
#   description = "username"
#   type        = string
#   sensitive   = true
# }

# variable "password" {
#   description = "password"
#   type        = string
#   sensitive   = true
# }

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}


# variable "tags_instance" {
#   description = "les tags des instances"
#   type        = map(any)
# }

variable "ami" {
  description = "ami"
  type        = string
}

################################### VPC variables #############################################
variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "instance_tenancy" {
  description = "Type of VPC tenancy (default or dedicated)"
  type        = string
}

variable "enable_dns_support" {
  description = "enable dns"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "enable hostname"
  type        = bool
}


variable "tags_vpc" {
  type = map(any)
}
################################### internet gateway #############################################


variable "tags_igw" {
  type = map(any)
}

################################### elastic ip #############################################

variable "tags_eip" {
  type = map(any)
}

############################### public route_table ##############################

variable "rt_tags_pub" {
  type = map(any)
}
variable "rt_cidr_block_pub" {
  type = string
}

############################### Private route_table ##############################

variable "rt_tags_priv" {
  type = map(any)
}

variable "rt_cidr_block_priv" {
  type = string
}

#################### Web tier 1a (subnet 1) #######################################

variable "tags_subnet_1" {
  type = map(any)
}

variable "public_1" {
  type = bool
}

variable "az_subnet_1" {
  type = string
}

variable "cidr_subnet_1" {
  type = string
}

#################### Web tier 1b (subnet 2) #######################################

variable "tags_subnet_2" {
  type = map(any)
}

variable "cidr_subnet_2" {
  type = string
}

variable "az_subnet_2" {
  type = string
}

variable "public_2" {
  type = bool
}

############################## app Tier 1a (subnet 3) ###################################

variable "cidr_subnet_3" {
  type = string
}

variable "az_subnet_3" {
  type = string
}

variable "tags_subnet_3" {
  type = map(any)
}

variable "public_3" {
  type = bool
}
############################## app Tier 1b (subnet 4) ###################################

variable "cidr_subnet_4" {
  type = string
}

variable "az_subnet_4" {
  type = string
}

variable "tags_subnet_4" {
  type = map(any)
}

variable "public_4" {
  type = bool
}

#################### NAT #######################################

variable "tags_nat" {
  type = map(any)
}

#################### sg_alb_web #######################################


variable "ingress_rules_web" {
  type = list(any)
}

variable "sg_name_web" {
  type = string
}

variable "egress_rules_web" {
  type = list(any)
}

variable "sg_description_web" {
  type = string
}

variable "tags_sg_web" {
  type = map(any)
}

############################## sg_alb_app ###################################

variable "ingress_rules_app" {
  type = list(any)

}
variable "sg_name_app" {
  type = string
}
variable "egress_rules_app" {
  type = list(any)
}
variable "sg_description_app" {
  type = string
}

variable "tags_sg_app" {
  type = map(any)
}

############################## web alb ###################################

variable "tags_alb_web" {
  type = map(any)
}
############################## app alb ###################################

variable "tags_alb_app" {
  type = map(any)
}
############################## web target group ###################################

variable "tags_web_tg" {
  type = map(any)
}
############################## app target group ###################################

variable "tags_app_tg" {
  type = map(any)
}

############################## sg_web_server ###################################


variable "sg_name_web_server" {
  type = string
}

variable "egress_rules_web_server" {
  type = list(any)
}

variable "sg_description_web_server" {
  type = string
}

variable "tags_sg_web_server" {
  type = map(any)
}

############################## sg_app_server ###################################

variable "sg_name_app_server" {
  type = string
}

variable "egress_rules_app_server" {
  type = list(any)
}

variable "sg_description_app_server" {
  type = string
}

variable "tags_sg_app_server" {
  type = map(any)
}
