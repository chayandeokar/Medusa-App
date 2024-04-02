aws_region                       = "ap-south-1"
vpc_cidr_block                   = "10.0.0.0/16"
ecs_cluster_name                 = "medusa-cluster"
ecs_cluster_task_family          = "medusa-task"
ecs_cluster_task_network_mode    = "awsvpc"
ecs_cluster_task_compatibilities = ["FARGATE"]
ecs_cluster_task_cpu             = "512"
ecs_cluster_task_memory          = "1024"
ecs_service_name                 = "medusa-service"
ecs_service_subnets              = ["subnet-0f576643d9d2ba7a1", "subnet-0bca51b1bff4663d4"]
ecs_service_sg                   = ["sg-04533a7aff8fc4c43"]
ecs_service_enable_public_ip     = true
ecs_service_desired_count        = 1
