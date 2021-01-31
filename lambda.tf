resource "aws_lambda_function" "schedule_ec2_lambda_start" {
  filename          = "${data.archive_file.file_lambda.output_path}"
  function_name     = "${var.lambda_function_name}"
  role              = "${aws_iam_role.schedule_ec2_role.arn}"
  handler           = "${var.lambda_handler}"
  timeout           = "${var.lambda_timeout}"
  source_code_hash  = "${data.archive_file.file_lambda.output_base64sha256}"
  runtime           = "python3.8"

}
 
data "archive_file" "file_lambda" {
  type = "zip"
  source_file = "ec2_start.py"
  output_path = "ec2_start.zip"
}


resource "aws_lambda_function" "schedule_ec2_lambda_stop" {
  filename          = "${data.archive_file.file_lambda_stop.output_path}"
  function_name     = "${var.lambda_function_name_stop}"
  role              = "${aws_iam_role.schedule_ec2_role.arn}"
  handler           = "${var.lambda_handler_stop}"
  timeout           = "${var.lambda_timeout}"
  source_code_hash  = "${data.archive_file.file_lambda_stop.output_base64sha256}"
  runtime           = "python3.8"

}
 
data "archive_file" "file_lambda_stop" { 
  type = "zip"
  source_file = "ec2_stop.py"
  output_path = "ec2_stop.zip"
}
