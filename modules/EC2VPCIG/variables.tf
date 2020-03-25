variable "vpc_cidr" {
  description = "the cidr of the VPC"
  type        = string
}

variable "publicSubnetNewbits" {
    description = "number of additional bits with which to extend the vpc cidr"
    type        = number
}

variable "publicSubnetNetnum" {
    description = "a whole number that can be represented as a binary integer with no more than newbits binary digits, which will be used to populate the additional bits added to the prefix"
    type        = number
}

variable "filePathPublicInstancePublicSSHKey" {
    description = "the file path for the ssh_key.pub file"
    type = string
}

variable "filePathPublicInstancePrivateSSHKey" {
    description = "the file path for the ssh_key.pem file"
    type = string
}
