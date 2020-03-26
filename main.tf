provider "aws" {
  region = "us-east-1"
}
module "api_gateway" {
  source = "./modules/api_gateway"
  lambda_arn_invoke = module.lambda.invoke_arn
  stage_name = "v1"
}
module "lambda" {
  source = "./modules/lambda"
  runtime = "nodejs12.x"
  handler="index.handler"
  s3_key = "lambda-package.zip"
  s3_bucket ="serverless-express-node-lambda"
  execution_arn = module.api_gateway.execution_arn
  lambda_policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
     {
       "Action": "sts:AssumeRole",
       "Principal": {
         "Service": "lambda.amazonaws.com"
       },
       "Effect": "Allow",
       "Sid": ""
     }
   ]
 }
 EOF
}

output "base_url" {
  value = module.api_gateway.base_url
}
