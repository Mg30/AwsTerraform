output "invoke_arn" {
  value = aws_lambda_function.lambda_rest_api_code.invoke_arn
  description = " the invoke arn for the lambda"
}

output "function_arn" {
  value = aws_lambda_function.lambda_rest_api_code.arn
  description = " the arn of the lambda"
}