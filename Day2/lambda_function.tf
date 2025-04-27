
resource "aws_iam_role" "lambda_execution_role" {
  name               = "lambda_execution_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      }
    ]
  })
}

resource "aws_lambda_function" "hello_world" {
  function_name = "hello_world_lambda"

  s3_bucket = "backend-hagar"  
  s3_key    = "lambda_function.zip"  
  runtime = "python3.8"
  role    = aws_iam_role.lambda_execution_role.arn
  handler = "lambda_function.lambda_handler"
}


