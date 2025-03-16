output "iam_role_arn" {
  value = aws_iam_role.role.arn
  description = "O ARN da role IAM criada"
}

output "iam_role_name" {
  value = aws_iam_role.role.name
  description = "O name da role IAM criada"
}
