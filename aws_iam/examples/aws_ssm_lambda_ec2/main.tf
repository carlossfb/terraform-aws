##################################################################
#_____ IAM - ASSUME ROLE ________________________________________
##################################################################
data "aws_iam_policy_document" "assume_role" {

  dynamic "statement" {
    for_each = var.iam_role_configs.statement
    content {
      effect = statement.value.effect

      principals {
        type        = statement.value.type
        identifiers = statement.value.identifiers
      }

      actions = statement.value.actions
    }
  }
}

resource "aws_iam_role" "role" {
  name                 = var.iam_role_configs.name
  max_session_duration = var.iam_role_configs.max_session_duration
  assume_role_policy   = data.aws_iam_policy_document.assume_role.json
}

##################################################################
#_____ IAM - POLICIES ___________________________________________
##################################################################
data "aws_iam_policy_document" "policy" {

    dynamic "statement" {
      for_each = var.iam_policies.statement
      content {
        sid       = statement.value.sid
        effect    = statement.value.effect
        actions   = statement.value.actions
        resources = statement.value.resources
      }
  }
}

resource "aws_iam_policy" "policy" {
  name        = var.iam_policies.name
  description = var.iam_policies.description
  policy      = data.aws_iam_policy_document.policy.json

   depends_on = [data.aws_iam_policy_document.policy]
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn

  depends_on = [aws_iam_policy.policy]
}
