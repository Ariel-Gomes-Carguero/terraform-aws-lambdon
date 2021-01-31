resource "aws_cloudwatch_event_rule" "schedule_cloudwatch_start" {
  name                  = "${var.cloudwatch_name}"
  description           = "${var.cloudwatch_description}"
  schedule_expression   = "cron(00 06 * * ? *)"
}

resource "aws_cloudwatch_event_target" "schedule_cloudwatch_target" {
  rule      = "${aws_cloudwatch_event_rule.schedule_cloudwatch_start.name}"
  target_id = "ScheduleEC2start"
  arn       = "${aws_lambda_function.schedule_ec2_lambda_start.arn}"
}


resource "aws_cloudwatch_event_rule" "schedule_cloudwatch_stop" {
  name                  = "${var.cloudwatch_name_2}"
  description           = "${var.cloudwatch_description_2}"
  schedule_expression   = "cron(00 22 * * ? *)"
}

resource "aws_cloudwatch_event_target" "schedule_cloudwatch_target_stop" {
  rule      = "${aws_cloudwatch_event_rule.schedule_cloudwatch_stop.name}"
  target_id = "ScheduleEC2stop"
  arn       = "${aws_lambda_function.schedule_ec2_lambda_stop.arn}"
}