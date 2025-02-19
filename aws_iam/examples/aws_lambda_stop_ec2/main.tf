##################################################################
#_____ LAMBDA ____________________________________________________
##################################################################

resource "aws_lambda_function" "stop_ec2_lambda" {
  function_name = "stop_ec2_instances"
  role          = module.iam_role.iam_role_arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 20

  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
}


##################################################################
#_____ EVENT BRIDGE ______________________________________________
##################################################################

resource "aws_cloudwatch_event_rule" "lambda_schedule" {
  name                = "lambda-daily-schedule"
  description         = "Regra para agendar execução da Lambda todos os dias às 20h em Brasília"
  schedule_expression = "cron(15 1 * * ? *)"

}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.lambda_schedule.name
  target_id = "LambdaTarget"
  arn       = aws_lambda_function.stop_ec2_lambda.arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.stop_ec2_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_schedule.arn
}
