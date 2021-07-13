variable "region" {
  description = "The name of the AWS Region"
  type        = string
  default     = "us-west-2"                 # 5. Put your region here
  }


variable "env" {
  description = "Environment"
  type        = string
}

variable "runtime" {
  description = "Runtime"
  type        = map(string)
  default     = {
    test  = "python3.7"
    stage = "python3.8"
  }
}