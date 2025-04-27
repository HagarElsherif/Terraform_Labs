resource "aws_iam_role" "lambda_role" {
  name = "lambda_ses_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect    = "Allow",
      Sid       = ""
    }]
  })
}

resource "aws_iam_policy_attachment" "lambda_ses_attach" {
  name       = "lambda-ses-attach"
  roles      = [aws_iam_role.lambda_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSESFullAccess"
}

resource "aws_lambda_function" "send_email_lambda" {
  function_name = "send_email_lambda"
  runtime       = "python3.8"
  handler       = "send_email_lambda.lambda_handler"
  role          = aws_iam_role.lambda_role.arn

  s3_bucket = "backend-hagar"  
  s3_key    = "send_email_lambda.zip"
  
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "backend-hagar" 

  lambda_function {
    lambda_function_arn = aws_lambda_function.send_email_lambda.arn
    events              = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]
    filter_prefix       = "env/dev/" 
  }

  depends_on = [aws_lambda_permission.allow_s3]
}

resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.send_email_lambda.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::backend-hagar"
}

