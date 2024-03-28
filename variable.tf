variable "aws_region" {
  description = "provide aws region example : ap-south-1"
  type        = string
}
variable "vpc_cidr_block" {
  description = ""
  type        = string
}
variable "ecs_cluster_name" {
  description = ""
  type        = string
}
variable "ecs_cluster_task_family" {
  description = ""
  type        = string
}
variable "ecs_cluster_task_network_mode" {
  description = ""
  type        = string
}
variable "ecs_cluster_task_compatibilities" {
  description = ""
  type        = list(string)
}
variable "ecs_cluster_task_cpu" {
  description = ""
  type        = string
}
variable "ecs_cluster_task_memory" {
  description = ""
  type        = string
}
variable "ecs_service_name" {
  description = ""
  type        = string
}
variable "ecs_service_subnets" {
  description = ""
  type        = list(string)
}
variable "ecs_service_sg" {
  description = ""
  type        = list(string)
}
variable "ecs_service_enable_public_ip" {
  description = ""
  type        = bool
}
variable "ecs_service_desired_count" {
  description = ""
  type        = number
}