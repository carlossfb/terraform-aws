iam_role_configs = {
  name                 = "MyLambdaRole"
  max_session_duration = 3600
  statement = [
    {
      identifiers = ["lambda.amazonaws.com"]
      effect      = "Allow"
      type        = "Service"
      actions     = ["sts:AssumeRole"]
    }
  ]
}

iam_policies = {
  name        = "MyPolicy"
  description = "My custom policy description"
  statement = [
    {
      sid     = "AllowSSMSendCommand"
      effect  = "Allow"
      actions = ["ssm:SendCommand"]
      resources = [
        "arn:aws:ssm:*:*:document/AWS-RunShellScript",
        "arn:aws:ec2:*:*:instance/*"
      ]
    },
    {
      sid     = "AllowSSMGetCommandInvocation"
      effect  = "Allow"
      actions = ["ssm:GetCommandInvocation"]
      resources = [
        "arn:aws:ssm:*:*:document/AWS-RunShellScript",
        "arn:aws:ssm:*:*:*/*",
        "arn:aws:ssm:us-east-1:127214179485:*"
      ]
    }
  ]
}
