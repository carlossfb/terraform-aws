##################################################################
#_____ IAM _______________________________________________________
##################################################################

module "iam_role" {
  source = "github.com/carlossfb/terraform-aws/aws_iam/modules/aws_role"

  iam_role_configs = {
    name                 = "ec2-s3-gitlab-registry"
    max_session_duration = 3600
    statement = [
      {
        identifiers = ["ec2.amazonaws.com"]
        effect      = "Allow"
        type        = "Service"
        actions     = ["sts:AssumeRole"]
      }
    ]
  }

  iam_policies = {
    name        = "s3-access-gitlab-registry"
    description = "Allow modify specific bucket"
    statement = [
      {
        "Version" : "2012-10-17",
        "Statement" : [
          {
            "Effect" : "Allow",
            "Action" : [
              "s3:*",
              "s3-object-lambda:*"
            ],
            "Resource" : "${output.arn_bucket}"
          }
        ]
      }
    ]
  }
}