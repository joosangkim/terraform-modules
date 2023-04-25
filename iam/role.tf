resource "aws_iam_role" "this" {
  count = var.iam_role.create ? 1 : 0

  name               = var.iam_role.name
  assume_role_policy = length(var.iam_role.assume_role_policy) > 0 ? jsonencode(var.iam_role.assume_role_policy) : null
  tags               = var.tags
}

resource "aws_iam_role_policy" "policy" {
  count = var.iam_role.create && length(var.iam_role.policy_attachment) > 0 ? 1 : 0

  name   = "${aws_iam_role.this[0].name}-policy"
  role   = aws_iam_role.this[0].id
  policy = length(var.iam_role.policy_attachment) > 0 ? jsonencode(var.iam_role.policy_attachment) : null
}

resource "aws_iam_role_policy_attachment" "policy" {
  count = var.iam_role.policy_arn == "" ? 0 : 1

  role       = aws_iam_role.this[0].id
  policy_arn = var.iam_role.policy_arn
}
