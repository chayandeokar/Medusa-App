
# Create a VPC, subnets, and security group
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

# Define ECS cluster
resource "aws_ecs_cluster" "medusa_cluster" {
  name = var.ecs_cluster_name
  capacity_providers  = ["FARGATE"]
  default_capacity_provider_strategy {
      capacity_provider {
        name = "FARGATE"
        weight = 5
        base = 5
      }
  }
}

# Define ECS task definition
resource "aws_ecs_task_definition" "medusa_task" {
  family                   = var.ecs_cluster_task_family
  container_definitions    = file("container_definitions.json")
  network_mode             = var.ecs_cluster_task_network_mode
  requires_compatibilities = var.ecs_cluster_task_compatibilities
  cpu                      = var.ecs_cluster_task_cpu
  memory                   = var.ecs_cluster_task_memory
}

# Define ECS service
resource "aws_ecs_service" "medusa_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.medusa_cluster.id
  task_definition = aws_ecs_task_definition.medusa_task.arn
  desired_count   = var.ecs_service_desired_count

  capacity_provider_strategy {
    capacity_provider {
      name = "FARGATE"
      weight = 5
      base = 5
    }

  network_configuration {
    subnets          = var.ecs_service_subnets
    security_groups  = var.ecs_service_sg
    assign_public_ip = var.ecs_service_enable_public_ip
  }
}
