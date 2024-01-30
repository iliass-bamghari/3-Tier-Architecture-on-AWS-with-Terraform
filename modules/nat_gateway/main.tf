resource "aws_nat_gateway" "pfs_nat" {
  subnet_id     =  var.nat_subnet_id
  allocation_id = var.eip_id
  tags = var.tags_nat
  
}