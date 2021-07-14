locals {
  lambda = {
    "get_lambda" = {
      filename = "lambda/get.zip",
      source_file = "src/get.py",
      function_name = "lambda-get",
      handler = "get.lambda_handler"
      url = "w0w6pf6wy3.execute-api.us-west-2.amazonaws.com"   # 6. Put your URL here
      port = "443"                                             # 6. Put your PORT here
      api = "demo/creds"

    }
    "post_lambda" = {
      filename = "lambda/post.zip",
      source_file = "src/post.py",
      function_name = "lambda-post",
      handler = "post.lambda_handler"
      url = "w0w6pf6wy3.execute-api.us-west-2.amazonaws.com"   # 6. Put your URL here
      port = "443"                                             # 6. Put your PORT here  
      api = "demo/creds" 
   
    }
  }
}


data "archive_file" "get" {
  for_each = local.lambda
  type        = "zip"
  source_file = each.value.source_file
  output_path = each.value.filename
}


resource "aws_lambda_function" "get_lambda" {
  for_each = local.lambda
  filename      = each.value.filename
  function_name = each.value.function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = each.value.handler

  source_code_hash = filebase64sha256(each.value.filename)

  runtime = var.runtime[var.env]
  
  environment {
    variables = {
      URL = each.value.url
      PORT = each.value.port
      API = each.value.api
    }
  }
}