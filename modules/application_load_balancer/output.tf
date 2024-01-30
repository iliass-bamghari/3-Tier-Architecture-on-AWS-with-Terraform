output alb_arn{
  value = aws_lb.pfs_alb.arn
}
# .arn is a globally unique identifier across AWS

output alb_dns_name{
  value = aws_lb.pfs_alb.dns_name
}