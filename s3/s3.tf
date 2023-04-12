resource "aws_s3_bucket" "this" {
  bucket = "${var.name}"

  tags = var.tags
}


resource "aws_s3_bucket_versioning" "version" {
  bucket = "${var.name}"
  versioning_configuration {
    status = var.versioning ? "Enabled" : "False"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = "${var.name}"
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = "${var.name}"

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms
      sse_algorithm     = "aws:kms"
    }
  }
}
