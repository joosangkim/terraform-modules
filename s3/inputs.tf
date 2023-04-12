variable "name" {
  default = "ShiaSampleBucket"
}

variable "versioning" {
  default = false
}

variable "kms" {
  default = "arn:aws:kms:ap-northeast-2:583115555533:key/cfb83db7-38e4-4706-aa92-e57b07914eeb"
}

variable "tags" {}

variable "region" {
  default = "ap-northeast-2"
}
