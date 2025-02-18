##################################################################
#_____ IAM _______________________________________________________
##################################################################

module "iam_role" {
  source = "github.com/carlossfb/terraform-aws/aws_iam/modules/aws_role"

  iam_role_configs = {
    name                 = "lambda-ec2-stop"
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
    name        = "ec2-stop-instance"
    description = "Allow stop ec2 instance"
    statement = [
      {
        sid       = "AllowSSMSendCommand"
        effect    = "Allow"
        actions   = ["ec2:StopInstances"]
        resources = ["*"]
      }
    ]
  }
}