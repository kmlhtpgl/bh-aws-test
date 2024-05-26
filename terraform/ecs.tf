resource "aws_ecs_cluster" "app" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "app" {
  family                   = var.task_family
  container_definitions    = jsonencode([
    {
      name      = "bh-kml"
      image     = "${aws_ecr_repository.app.repository_url}:latest"
      memory    = 512
      cpu       = 256
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
    }
  ])
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = "3072"
  cpu                      = "1024"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
}

resource "aws_iam_role" "ecs_task_execution" {
  name = "ecsTaskExecutionRole1"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_attach1" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_service" "app" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.app.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets         = var.subnets
    security_groups = [aws_security_group.ecs_service.id]
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.app.arn
    container_name   = var.container_name
    container_port   = 8080
  }
}
