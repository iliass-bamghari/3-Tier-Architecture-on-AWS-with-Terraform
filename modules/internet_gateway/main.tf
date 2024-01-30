resource "aws_internet_gateway" "pfs_vpc_igw" {
  vpc_id = var.vpc_id
  tags = var.tags_igw
}