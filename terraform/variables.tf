variable "github_token" {
    description = "GitHub Personal Access Token"
}
variable "github_repo" {
  default = "bh-aws-test"
}
variable "aws_region" {
  default = "us-east-1"
}

variable "ecr_repo" {
  default = "bh-kml-ecr_repo"
}

variable "build_name" {
  default = "bh-kml-build"
}

variable "build_source" {
  default = "https://github.com/kmlhtpgl/bh-aws-test"
}

variable "build_compute" {
  default = "BUILD_GENERAL1_SMALL"
}

variable "build_image" {
  default = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}

variable "build_type" {
  default = "LINUX_CONTAINER"
}

variable "cluster_name" {
  default = "bh-kml-cluster"
}

variable "task_family" {
  default = "bh-kml-task"
}

variable "service_name" {
  default = "my-app-service"
}

variable "subnets" {
  description = "List of subnet IDs"
  type        = list(string)
  default     = ["subnet-074f33a3953c16a25", "subnet-0f12f5ba9b316f936"]
}

variable "container_name" {
  default = "bh-kml"
}

variable "lb_name" {
  default = "bh-kml-lb"
}

variable "tg_name" {
  default = "bh-kml-tg"
}

variable "vpc_id" {
  default = "vpc-095cf746d56c9d4c8"
}