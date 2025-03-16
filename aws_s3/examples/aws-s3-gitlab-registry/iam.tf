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
        sid       = "AllowRegistryManageBucket"
        effect    = "Allow"
        actions   = ["s3-object-lambda:*", "s3:*"]
        resources = ["${module.bucket.arn}"]
      }
    ]
  }
}

resource "aws_iam_instance_profile" "ec2_s3_gitlab_registry_profile" {
  name = "ec2-s3-gitlab-profile"
  role = module.iam_role.iam_role_name
}