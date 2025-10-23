resource "aws_codebuild_project" "s3_deploy" {
  name          = "s3-deploy-project"
  description   = "Build project to deploy GitHub repo to S3"
  build_timeout = 5

  service_role = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:7.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = false
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/lukzhang/YOUR_REPO_NAME/aws-terraform-iac"
    git_clone_depth = 1
    buildspec       = "buildspec.yml"
  }

  tags = {
    Environment = "Dev"
    Project     = "TerraformDemo"
  }
}
