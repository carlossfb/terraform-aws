output "iam_role_arn" {
  value = aws_iam_role.role.arn
  description = "O ARN da role IAM criada"
}
