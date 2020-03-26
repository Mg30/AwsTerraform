variable "handler" {
    description = "the handler of the lamda format : file.functionname"
    type = string
}

variable "runtime" {
    description = "the runtime of lambda"
    type = string
}

variable "s3Key" {
    description = "the key of the zip package of the lambda function to deploy"
    type = string
}

variable "s3Bucket" {
    description = "the name of S3 bucket to deploy the zip package"
    type = string
}

variable "lambdaPolicy" {
    description = "policy to apply to lambda function"
    type = string
}