 resource "aws_iam_role" "lambda_function_role" {
   name = "ServerlessApiLambdaExec"
   assume_role_policy = var.lambda_policy

 }

resource "aws_lambda_function" "lambda_rest_api_code" {
   function_name = "serverless_api"
   s3_bucket = var.s3_bucket
   s3_key    = var.s3_key
   handler = var.handler
   runtime = var.runtime
   role = aws_iam_role.lambda_function_role.arn
 }


  resource "aws_lambda_permission" "apigw" {
   statement_id  = "AllowAPIGatewayInvoke"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.lambda_rest_api_code.function_name
   principal     = "apigateway.amazonaws.com"

   # The "/*/*" portion grants access from any method on any resource
   # within the API Gateway REST API.
   source_arn = "${var.execution_arn}/*/*"
 }