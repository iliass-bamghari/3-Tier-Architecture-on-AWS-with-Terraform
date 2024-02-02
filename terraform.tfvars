# terraform.tfvars

################################### instances variables #############################################

region = "eu-north-1"

instance_type = "t3.micro"

#ubuntu ami ami = "ami-0fe8bec493a81c7da"
# amazon linux ami 
ami = "ami-09ed8fb06b42a771d"

# tags_instance = {
#   Name = "ubuntu"
#   Kind = "server"
# }

key_name = "AWS"

################################### VPC variables #############################################


cidr_block = "10.0.0.0/16"

tags_vpc = {
  Name = "pfs-vpc",
  Kind = "test"
}

instance_tenancy = "default"
enable_dns_support = "true"
enable_dns_hostnames = "true"

################################### internet gateway #############################################

tags_igw = {
  Name = "pfs-igw",
  Kind = "test"
}

################################### elastic ip #############################################


tags_eip = {
  Name = "pfs-eip-1",
  Kind = "test"
}

############################## public route_table ##############################

rt_tags_pub = {
  Name = "pfs-rt-public",
  Kind = "test"
}

rt_cidr_block_pub = "0.0.0.0/0"

############################## private route_table ##############################

rt_tags_priv = {
  Name = "pfs-rt-private",
  Kind = "test"
}

rt_cidr_block_priv = "0.0.0.0/0"
############################## subnet-1-public-eu-north-1a ##############################

cidr_subnet_1 = "10.0.1.0/24"

az_subnet_1   = "eu-north-1a"

public_1      = "true"

tags_subnet_1 = {
  Name = "pfs-pub-eu-north-1a",
  Kind = "test"
}

############################## subnet-2-public-eu-north-1b ##############################

cidr_subnet_2 = "10.0.2.0/24"

az_subnet_2   = "eu-north-1b"

public_2      = "true"

tags_subnet_2 = {
  Name = "pfs-pub-eu-north-1b",
  Kind = "test"
}

############################## subnet-3-private-eu-north-1b ##############################

cidr_subnet_3 = "10.0.3.0/24"
az_subnet_3   = "eu-north-1a"
public_3      = "false"

tags_subnet_3 = {
  Name = "pfs-priv-eu-north-1a",
  Kind = "test"
}

############################## subnet-4-private-eu-north-1b ##############################

cidr_subnet_4 = "10.0.4.0/24"
az_subnet_4   = "eu-north-1b"
public_4      = "false"

tags_subnet_4 = {
  Name = "pfs-priv-eu-north-1b",
  Kind = "test"
}
############################## NAT ##############################

tags_nat = {
  Name = "pfs-nat-1",
  Kind = "test"
}

############################## sg_alb_web ##############################

sg_name_web = "web-alb-sg"
tags_sg_web = {
  Name = "pfs-web-alb-sg",
  Kind = "test"
}

ingress_rules_web = [
  {
    description     = "allow  443"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  },
  {
    description     = "allow on 80"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  },
  {
    description     = "allow on 22"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  },
  {
    description     = "allow on 3000"
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  },
  {
    description     = "allow on 8080"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]

egress_rules_web = [
  {
    description     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]
sg_description_web = " SG for WEB ALB"

############################## sg_alb_app ##############################

sg_name_app = "app-alb-sg"

tags_sg_app = {
  Name = "pfs-app-alb-sg",
  Kind = "test"
}

ingress_rules_app = [
  {
    description     = "allow on 443"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  },
  {
    description     = "allow on 80"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  },
  {
    description     = "allow on 22"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  },
  {
    description     = "allow on 8080"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }

]

egress_rules_app = [
  {
    description     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]

sg_description_app = " SG for APP ALB"

############################## web alb ###################################

tags_alb_web = {
  Name = "pfs-webtier-alb",
  Kind = "test"
}
############################## app alb ###################################

tags_alb_app = {
  Name = "pfs-apptier-alb",
  Kind = "test"
}

############################## web target group ###################################

tags_web_tg = {
  Name = "pfs-webtier-tg",
  Kind = "test"
}

############################## app target group ###################################

tags_app_tg = {
  Name = "pfs-apptier-tg",
  Kind = "test"
}

############################## sg_web_server ###################################

sg_name_web_server = "web_server-sg"

tags_sg_web_server = {
  Name = "pfs-web_server-sg",
  Kind = "test"
}


egress_rules_web_server = [
  {
    description     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]

sg_description_web_server = " SG for web_server"

############################## sg_app_server ###################################

sg_name_app_server = "app_server-sg"
tags_sg_app_server = {
  Name = "pfs-app_server-sg",
  Kind = "test"
}

egress_rules_app_server = [
  {
    description     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = null
  }
]
sg_description_app_server = " SG for app_server"
