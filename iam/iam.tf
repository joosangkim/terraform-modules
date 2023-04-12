resource "aws_iam_role" "this" {
  name = var.name
  assume_role_policy = length(var.assume_role_policy) > 0 ? jsonencode(var.assume_role_policy): null
  tags = var.tags
}

resource "aws_iam_role_policy" "policy" {
  count = length(var.policy_attachment) > 0 ? 1: 0

  name = var.name
  role = aws_iam_role.this.id
  policy = jsonencode(var.policy_attachment)
}

resource "aws_iam_role_policy_attachment" "policy" {
  count = var.policy_arn == "" ? 0 : 1

  role = aws_iam_role.this.id
  policy_arn = var.policy_arn
}