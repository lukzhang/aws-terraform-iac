resource "aws_s3_bucket_policy" "codepipeline_artifacts" {
  bucket = "luke-terraform-demo-bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowCodePipelinePutObject",
        Effect    = "Allow",
        Principal = {
          Service = "codepipeline.amazonaws.com"
        },
        Action    = "s3:PutObject",
        Resource  = "arn:aws:s3:::luke-terraform-demo-bucket/*"
      }
    ]
  })
}
