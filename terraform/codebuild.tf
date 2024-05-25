resource "aws_codebuild_project" "app" {
  name          = var.build_name
  source {
    type            = "GITHUB"
    location        = var.build_source
    git_clone_depth = 1
  }
  environment {
    compute_type                = var.build_compute
    image                       = var.build_image
    type                        = var.build_type
    privileged_mode             = true
  }
  service_role = aws_iam_role.codebuild.arn
  artifacts {
    type = "NO_ARTIFACTS"
  }
  logs_config {
    cloudwatch_logs {
      group_name = "bh-kml_logs"
    }
  }
}

resource "aws_iam_role" "codebuild" {
  name = "codebuild-role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "codebuild_attach" {
  role       = aws_iam_role.codebuild.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

resource "aws_iam_role_policy_attachment" "codebuild_attach" {
  role       = aws_iam_role.codebuild.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_role_policy_attachment" "codebuild_attach" {
  role       = aws_iam_role.codebuild.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

