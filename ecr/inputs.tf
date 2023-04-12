variable "region" {
  default = "ap-northeast-2"
}

variable "create" {
  default = true
}

variable "name" {
  default = "ai-an2-infra-sample-01"
}

variable "expire_count" {
  default = 30
}

variable "kms" {
  default = "arn:aws:kms:ap-northeast-2:583115555533:key/cfb83db7-38e4-4706-aa92-e57b07914eeb"

}

variable "tags" {}