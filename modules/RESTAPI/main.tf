 resource "aws_iam_role" "MyLambdaFunctionRole" {
   name = "ServerlessApiLambdaExec"
   assume_role_policy = var.lambdaPolicy

 }

resource "aws_lambda_function" "MyFunction" {
   function_name = "ServerlessApi"
   s3_bucket = var.s3Bucket
   s3_key    = var.s3Key
   handler = var.handler
   runtime = var.runtime
   role = aws_iam_role.MyLambdaFunctionRole.arn
 }


