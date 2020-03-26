variable "handler" {
    description = "the handler of the lamda format : file.functionname"
    type = string
}

variable "runtime" {
    description = "the runtime of lambda"
    type = string
}

variable "s3_key" {
    description = "the key of the zip package of the lambda function to deploy"
    type = string
}

variable "s3_bucket" {
    description = "the name of S3 bucket to deploy the zip package"
    type = string
}

variable "lambda_policy" {
    description = "policy to apply to lambda function"
    type = string
}
variable "execution_arn" {
    description = "policy to apply to lambda function"
    type = string
}