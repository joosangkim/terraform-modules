output "output" {
  value = <<EOT
  {
    "repository_arn": ${aws_codecommit_repository.this.arn}
    "clone_url_http": ${aws_codecommit_repository.this.clone_url_http}
  }
EOT
}