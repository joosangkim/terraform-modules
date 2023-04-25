output "role" {
  value = var.iam_role.create ? aws_iam_role.this[0] : null
}

output "user" {
  value = var.iam_user.create ? aws_iam_user.this[0] : null
}