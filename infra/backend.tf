terraform {
  backend "s3" {
    bucket = "__backendAWSBucketName__"
    key    = "__backendAWSKey__"
    region = "__aws_Region__"
  }
}