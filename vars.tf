variable "policy_name" { 
  default = "ScheduleEC2Policy"
}

variable "policy_description" { 
  default = "Policy que permite o Lambda a desligar e ligar as instâncias do ec2"
}

variable "role_name" { 
  default = "ec2lambda"
}

variable "role_description" { 
  default = "Role que permite o Lambda a desligar e ligar Instancias ec2."
}

variable "lambda_function_name" { 
  default = "ScheduleEC2-start"
}


variable "lambda_function_name_stop" { 
  default = "ScheduleEC2-stop"
}


variable "lambda_handler" { 
  default = "ec2_start.lambda_handler"
}


variable "lambda_handler_stop" { 
  default = "ec2_stop.lambda_handler"
}


variable "lambda_timeout" { 
  default = "10"
}


variable "cloudwatch_name" { 
  default = "ScheduleEC2started"
}

variable "cloudwatch_name_2" { 
  default = "ScheduleEC2stopped"
}


variable "cloudwatch_description" { 
  default = "Liga instancias EC2"
}

variable "cloudwatch_description_2" { 
  default = "Desliga instancias EC2"
}