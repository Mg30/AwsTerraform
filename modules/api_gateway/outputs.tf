output "base_url" {
  value = aws_api_gateway_deployment.api_deployement.invoke_url
} 
output "execution_arn" {
  value = aws_api_gateway_rest_api.express_api.execution_arn
}
