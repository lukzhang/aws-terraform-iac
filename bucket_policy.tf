resource "aws_s3_bucket_policy" "codepipeline_artifacts" {
  bucket = "luke-terraform-demo-bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowCodePipelineRolePutObject",
        Effect    = "Allow",
        Principal = {
          AWS = aws_iam_role.codepipeline_role.arn
        },
        Action    = "s3:PutObject",
        Resource  = "arn:aws:s3:::luke-terraform-demo-bucket/*"
      }
    ]
  })
}
