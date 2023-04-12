policy_attachment = {
  Version= "2012-10-17",
  Statement= [
    {
      Sid = "logs"
      Action= [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      Effect= "Allow",
      Resource= "*"
    },
    {
      Sid = "S3"
      Action= [
        "s3:Get*",
        "s3:Put*",
        "s3:List*"
      ],
      Effect= "Allow",
      Resource= [
        "arn:aws:s3:::ai-an2-cia-s3-build-cache-01-d",
        "arn:aws:s3:::ai-an2-cia-s3-build-cache-01-d/*",
        "arn:aws:s3:::ai-an2-cia-s3-build-logs-01-d",
        "arn:aws:s3:::ai-an2-cia-s3-build-logs-01-d/*"
      ]
    },
    {
      Sid = "CodeCommit"
      Action= [
        "codecommit:GitPull"
      ],
      Effect= "Allow",
      Resource = "arn:aws:codecommit:ap-northeast-2:446426223867:ai-an2-cia-codecommit-crawler-01-d"
    }
  ]
}