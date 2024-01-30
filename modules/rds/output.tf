output "db_endpoint" {
  value = replace(aws_db_instance.db.endpoint, ":3306", "")
}

output "db_password" {
  value     = aws_db_instance.db.password
  sensitive = true  # Mark as sensitive to avoid displaying in plain text
}
