resource "aws_eip" "pfs_eip" {
  domain      = "vpc"
  depends_on  = [var.igw]
  tags        = var.tags_eip
}
