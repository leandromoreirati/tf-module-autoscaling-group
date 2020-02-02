![alt text](https://www.terraform.io/assets/images/logo-hashicorp-3f10732f.svg)

# **tf-module-autoscaling-group**

Terraform module for creating Auto Scaling Group App.

This module will be configured to use ***mixed_instancePolicy***, which allows us to have on-demand and spot instances in the same AGS, thus providing all the scalability that ASG allows combined with resource savings ***spot*** makes it possible, but without losing the security of having ***on-demand*** instances in the environment.

 **Requirements**
 - Terraform
 - AWS Account

 **Dependencies**
 - Launch Template
 - AWS ELB
 - AWS Target Group
 - AWS Instance Profile

 **Example of Use**
 ------
```
module "auto_scaling_group" {
  source = "https://github.com/leandromoreirati/tf-module-autoscaling_group.git"

  name       = "RESOURCE_NAME"

  azs                                      = "${var.azs}"
  private_subnet                           = "${var.private_subnet}"
  asg_max                                  = "${var.asg_max}"
  asg_min                                  = "${var.asg_min}"
  asg_desired                              = "${var.asg_desired}"
  environment                              = "${var.environment}"
  launch_template_id                       = "${module.launch_template.launch_template_id}" 
  spot_allocation_strategy                 = "${var.spot_allocation_strategy}"
  spot_instance_pools                      = "${var.spot_instance_pools}"
  on_demand_base_capacity                  = "${var.on_demand_base_capacity}"
  on_demand_percentage_above_base_capacity = "${var.on_demand_percentage_above_base_capacity}"
  on_demand_allocation_strategy            = "${var.on_demand_allocation_strategy}"
  launch_template_version                  = "${module.launch_template.launch_template_version}"
  target_group_arns                        = "${module.target_group.lb_target_group_arn}"
  load_balancers                           = "${var.load_balancers}"

  tags = {
    "tag01"  = "value01"
    "tag02"  = "value03"
    "tag03"  = "tag03"
    "tagN"   = "tagN"
  }
}

```
 **Variables**
 ------
 |          Name                             |                     Description                           |      Default     |
 | ------------------------------------------|-----------------------------------------------------------|:----------------:|
 |  azs                                      | Availability Zones                                        |     ""           |
 |  private_subnet                           | Subnet Application ID                                     |     ""           |
 |  asg_max                                  | Maximum number of instances created by ASG                |     ""           |
 |  asg_min                                  | Minimum number of instances created by ASG                |"ChangeInCapacity"|
 |  asg_desired                              | Desired number of instances created by ASG                |     ""           |
 |  environment                              | Application Environment                                   |   false          |
 |  launch_template_id                       | Launch Template ID to be used by ASG                      |     ""           |
 |  spot_allocation_strategy                 | Number of instances created in scaledown process          |     ""           |
 |  spot_instance_pools                      | Number of instances created in scaleup process            |     ""           |
 |  on_demand_base_capacity                  | Minimum number of ** on-demand ** instances created by ASG|     "0"          |
 |  on_demand_percentage_above_base_capacity | Number of instances created in scaleup process            |     "100"        |
 |  on_demand_allocation_strategy            | Instance allocation strategy in mixed ASG                 |  "prioritized"   |
 |  launch_template_version                  | ** launch template version **                             |     ""           |
 |  target_group_arns                        | List of ARN's of ** target groups ** to be used in ASG    |     ""           |
 |  load_balancers                           | Name List of ** load balancers ** to be used in ASG       |     ""           |

 **Outputs**
 ------
 |              Nome       |                              Valor            |
 | ------------------------|:----------------------------------------------|
 | auto_scaling_group_arn  | aws_autoscaling_group.auto_scaling_group.arn  |
 | auto_scaling_group_id   | aws_autoscaling_group.auto_scaling_group.id   |
 | auto_scaling_group_name | aws_autoscaling_group.auto_scaling_group.name |

 **External Documentation**
 - [AWS Autoscaling](https://docs.aws.amazon.com/pt_br/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
 - [Terraform](https://www.terraform.io/docs/providers/aws/r/autoscaling_group.html)

 **Created Features**
 ------
 - Launch Template
 - Role IAM
 - Instance Profile
 - Security Group
 - Target Group
 - Classic Load Balancer (EBL)
 - Auto Scaling Group (ASG)