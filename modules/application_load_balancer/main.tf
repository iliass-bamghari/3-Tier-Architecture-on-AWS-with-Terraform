resource "aws_lb" "pfs_alb" {
  name               = var.name
  internal           = var.is_internal
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets
  enable_deletion_protection = false
  tags = var.tags_alb
}