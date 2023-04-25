resource "aws_iam_user" "this" {
  count = var.iam_user.create ? 1 : 0

  name = var.iam_user.name
  tags = var.tags
}

resource "aws_iam_user_ssh_key" "user" {
  count      = var.iam_user.pub_key != "" ? 1 : 0
  username   = aws_iam_user.this[0].name
  encoding   = "SSH"
  public_key = var.iam_user.pub_key
}

resource "aws_iam_user_policy" "policy" {
  count = var.iam_user.create ? 1 : 0

  name   = "${aws_iam_user.this[0].name}-policy"
  user   = aws_iam_user.this[0].name
  policy = jsonencode(var.iam_user.policy_attachment)
}
