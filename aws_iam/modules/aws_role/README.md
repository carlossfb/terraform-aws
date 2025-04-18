## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.test-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_policies"></a> [iam\_policies](#input\_iam\_policies) | Politicas para atribuir a role | <pre>object({<br/>    name        = string<br/>    description = optional(string, null)<br/>    statement = list(object({<br/>      sid       = optional(string, null)<br/>      effect    = optional(string, "Allow")<br/>      actions   = list(string)<br/>      resources = optional(list(string), ["*"])<br/>    }))<br/>  })</pre> | n/a | yes |
| <a name="input_iam_role_configs"></a> [iam\_role\_configs](#input\_iam\_role\_configs) | Configuracoes basicas da role. | <pre>object({<br/>    name                 = string<br/>    max_session_duration = optional(number, 1)<br/>    statement = list(object({<br/>      identifiers = list(string)<br/>      effect      = optional(string, "Allow")<br/>      type        = optional(string, "Service")<br/>      actions     = optional(list(string), ["sts:AssumeRole"])<br/>    }))<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | O ARN da role IAM criada |
