output "codebuild_project_name" {
  value = aws_codebuild_project.s3_deploy.name
}

output "codepipeline_name" {
  value = aws_codepipeline.s3_pipeline.name
}

output "s3_bucket_name" {
  value = "luke-terraform-demo-bucket"
}
