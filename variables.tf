variable "name" {
  default     = ""
  description = "Launch Template name."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Setting tags for the feature"
}

variable "vpc_id" {
  default     = ""
  description = "VPC ID"
}

variable "private_subnet" {
  default     = ""
  description = "Subnet ID "
}

variable "tenancy" {
  default     = "default"
  description = "The tenancy of the instance (if the instance is running in a VPC). Can be default, dedicated, or host."
}

variable "monitoring" {
  default     = "false"
  description = "The monitoring option for the instance."
}

variable "public_ip_association" {
  default     = "false"
  description = "Associate a public ip address with the network interface."
}

variable "ami" {
  default     = ""
  description = "ID AMI image."
}

variable "key_name" {
  default     = ""
  description = "Key pair name."
}

variable "instance_type" {
  default     = ""
  description = "Type of EC2 instance."
}

variable "azs" {
  default     = ""
  description = "Availability zones."
}

variable "environment" {
  default     = ""
  description = "Application environment."
}

variable "volume_size" {
  default     = ""
  description = "The size of the volume in gigabytes"
}

variable "volume_type" {
  default     = "standard"
  description = "The type of volume (standard, gp2, or io1)."
}

variable "delete_on_termination" {
  default     = "false"
  description = "Whether the volume should be destroyed on instance termination."
}

variable "device_name" {
  default     = ""
  description = "The name of the device to mount."
}

variable "spot_price" {
  default     = ""
  description = "The maximum bid price per unit hour."
}

variable "region" {
  default     = ""
  description = "AWS Region."
}

variable "account_id" {
  default     = ""
  description = "AWS Account ID."
}

variable "target_capacity" {
  default     = ""
  description = "Número de instancias spot a serem solicitados."
}

variable "wait_for_fulfillment" {
  default     = "false"
  description = "If set, Terraform will wait for the Spot Request to be fulfilled, and will throw an error if the timeout of 10m is reached."
}

variable "spot_allocation_strategy" {
  default     = "capacity-optimized"
  description = "How to allocate capacity across the Spot pools."
}

variable "spot_instance_pools" {
  default     = ""
  description = "Number of Spot pools per availability zone to allocate capacity."
}

variable "asg_min" {
  default     = ""
  description = "The minimum size of the autoscale group."
}

variable "asg_max" {
  default     = ""
  description = "The maximum size of the autoscale group."
}

variable "asg_desired" {
  default     = ""
  description = "The number of Amazon EC2 instances that should be running in the group."
}

variable "launch_template_id" {
  default     = ""
  description = "The ID of the launch template"
}

variable "on_demand_percentage_above_base_capacity" {
  default     = "100"
  description = "Percentage split between on-demand and Spot instances above the base on-demand capacity."
}

variable "on_demand_base_capacity" {
  default     = "0"
  description = "Minimum amount of desired capacity that must be fulfilled by on-demand instances."
}

variable "on_demand_allocation_strategy" {
  default     = "prioritized"
  description = "Strategy to use when launching on-demand instances."
}

variable "launch_template_version" {
  default     = ""
  description = "The latest version of the launch template."
}

variable "target_group_arns" {
  default     = []
  description = "List of Target Group ARNs that apply to this AutoScaling Group."
}

variable "load_balancers" {
  default     = ""
  description = "The load balancer names associated with the autoscaling group."
}

