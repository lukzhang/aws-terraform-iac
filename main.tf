resource "aws_s3_bucket" "static_assets" {
  bucket = "luke-terraform-demo-bucket"
  force_destroy = true
  tags = {
    Environment = "Dev"
    Project     = "TerraformDemo"
  }
}
