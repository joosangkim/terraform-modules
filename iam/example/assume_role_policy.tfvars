assume_role_policy = {
  Version = "2012-10-17",
  Statement= [
    {
      Action= "sts:AssumeRole",
      Effect= "Allow",
      Principal= {
        Service= "codebuild.amazonaws.com"
      }
    }
  ]
}