provider "aws" {
  region = "ap-south-1"
}

# Create a VPC, subnets, and security group
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Define ECS cluster
resource "aws_ecs_cluster" "medusa_cluster" {
  name = "medusa-cluster"
}

# Define ECS task definition
resource "aws_ecs_task_definition" "medusa_task" {
  family                   = "medusa-task"
  container_definitions    = file("container_definitions.json")
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
}

# Define ECS service
resource "aws_ecs_service" "medusa_service" {
  name            = "medusa-service"
  cluster         = aws_ecs_cluster.medusa_cluster.id
  task_definition = aws_ecs_task_definition.medusa_task.arn
  desired_count   = 1

  network_configuration {
    subnets         = ["subnet-1", "subnet-2"]
    security_groups = ["sg-12345678"]
    assign_public_ip = true
  }
}
