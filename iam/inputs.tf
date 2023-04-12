variable "name" {
  default = "ShaiSampleIAM"

}

variable "assume_role_policy" {
  type    = any
  default = {}
}

variable "policy_attachment" {
  type    = any
  default = {}
}

variable "policy_arn" {
  default = ""
}

variable "tags" {}

variable "region" {
  default = "ap-northeast-2"
}

variable "environment" {
  default = "dev"
}
