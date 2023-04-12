module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.6.0"

  create          = var.create
  repository_name = var.name

  repository_kms_key         = var.kms
  repository_encryption_type = "KMS"
  repository_image_tag_mutability = "MUTABLE"
  repository_image_scan_on_push = false
  repository_type = "private"

  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus   = "any",
          countType   = "imageCountMoreThan",
          countNumber = var.expire_count
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = var.tags
}
