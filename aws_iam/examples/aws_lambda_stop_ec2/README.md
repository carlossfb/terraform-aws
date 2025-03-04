## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=v1.6.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.83.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.83.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_role"></a> [iam\_role](#module\_iam\_role) | github.com/carlossfb/terraform-aws/aws_iam/modules/aws_role | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.lambda_schedule](https://registry.terraform.io/providers/hashicorp/aws/5.83.1/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.lambda_target](https://registry.terraform.io/providers/hashicorp/aws/5.83.1/docs/resources/cloudwatch_event_target) | resource |
| [aws_lambda_function.stop_ec2_lambda](https://registry.terraform.io/providers/hashicorp/aws/5.83.1/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.allow_eventbridge](https://registry.terraform.io/providers/hashicorp/aws/5.83.1/docs/resources/lambda_permission) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
