resource "aws_codepipeline" "s3_pipeline" {
  name     = "s3-deploy-pipeline"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = "luke-terraform-demo-bucket"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "GitHub_Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner  = "YOUR_GITHUB_USERNAME"
        Repo   = "YOUR_REPO_NAME"
        Branch = "main"
        OAuthToken = var.github_token
      }

      run_order = 1
    }
  }

  stage {
    name = "Build"

    action {
      name             = "CodeBuild_Deploy"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.s3_deploy.name
      }

      run_order = 1
    }
  }

  tags = {
    Environment = "Dev"
    Project     = "TerraformDemo"
  }
}
