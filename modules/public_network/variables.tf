variable "vpc_id" {
  description = "the id of the VPC to attach the public subnet"
  type        = string
}
variable "vpc_cidr" {
    description = "cidr of the vpc"
    type = string
}

variable "public_subnet_newbits" {
    description = "number of additional bits with which to extend the vpc cidr"
    type        = number
}

variable "public_subnet_netnum" {
    description = "a whole number that can be represented as a binary integer with no more than newbits binary digits, which will be used to populate the additional bits added to the prefix"
    type        = number
}