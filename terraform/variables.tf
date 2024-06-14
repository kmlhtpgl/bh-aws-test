variable "GITHUB_TOKEN" {
    description = "GitHub Personal Access Token"
}
variable "github_repo" {
  default = "bh-aws-test"
}
variable "aws_region" {
  default = "eu-west-2"
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
  default     = ["subnet-0720aca72b8244e5b", "subnet-0c843ae7a8f422eb2"]
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
  default = "vpc-0764919cd18276da6"
}

variable "pipeline_name" {
  default = "bh-kml-pipeline"
}

variable "github_owner" {
  default = "kmlhtpgl"
}