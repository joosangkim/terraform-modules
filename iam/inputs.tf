variable "iam_role" {
  type = any
  default = {
    create     = false
    policy_arn = ""
  }
}

variable "iam_user" {
  type = any
  default = {
    create  = false
    pub_key = ""
  }
}

variable "tags" {}
