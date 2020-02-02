
![alt text](https://www.terraform.io/assets/images/logo-hashicorp-3f10732f.svg)

# **tf-module-autoscaling-group**

Módulo Terraform para criação de App Auto Scaling Group.

Esse módulo sera configurado para usar a ***mixed_instancePolicy***, o que nos permite ter no mesmo AGS instâncias on-demand e spot, proporcionando assim toda a escalabidalide que o ASG permite aliado a econômia de recursos que a o uso de instancias **spot** possibilita, mas sem perder a segurança de ter instancias **on-demand** no ambiente.

 **Requisitos**
 - Terraform
 - AWS Account

 **Dependências**
 - Launch Template
 - AWS ELB
 - AWS Target Group
 - AWS Instance Profile

 **Exemplo de Uso**
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
 **Variáveis**
 ------
 |          Nome                             |                      Descrição                                       |      Default     |
 | ------------------------------------------|----------------------------------------------------------------------|:----------------:|
 |  azs                                      | Zonas de Disponibilidade                                             |     ""           |
 |  private_subnet                           | Subnet ID da Aplicação                                               |     ""           |
 |  asg_max                                  | Número máximo de instâncias criadas pelo ASG                         |     ""           |
 |  asg_min                                  | Número mínimo de instâncias criadas pelo ASG                         | ChangeInCapacity |
 |  asg_desired                              | Número desejado de instâncias criadas pelo ASG                       |     ""           |
 |  environment                              | Environment da aplicação                                             |   false          |
 |  launch_template_id                       | ID do Launch Template que será usado pelo ASG                        |     ""           |
 |  spot_allocation_strategy                 | Número de instâncias criadas no processo de scaledown                |     ""           |
 |  spot_instance_pools                      | Número de instâncias criadas no processo de scaleup                  |     ""           |
 |  on_demand_base_capacity                  | Número mínimo de instâncias **on-demand** criadas pelo ASG           |     "0"          |
 |  on_demand_percentage_above_base_capacity | Número de instâncias criadas no processo de scaleup                  |     "100"        |
 |  on_demand_allocation_strategy            | Estratégia de alocação de instâncias em umn ASG mixto                |  "prioritized"   |
 |  launch_template_version                  | Versão do **launch template**                                        |     ""           |
 |  target_group_arns                        | Lista do ARN's dos **target groups** a serem usados no ASG           |     ""           |
 |  load_balancers                           | Lista do Nomes dos **load balancers** a serem usados no ASG          |     ""           |


 **Outputs**
 ------
 |              Nome       |                              Valor            |
 | ------------------------|:----------------------------------------------|
 | auto_scaling_group_arn  | aws_autoscaling_group.auto_scaling_group.arn  |
 | auto_scaling_group_id   | aws_autoscaling_group.auto_scaling_group.id   |
 | auto_scaling_group_name | aws_autoscaling_group.auto_scaling_group.name |

 **Documentação externa**
 - [AWS Autoscaling](https://docs.aws.amazon.com/pt_br/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
 - [Terraform](https://www.terraform.io/docs/providers/aws/r/autoscaling_group.html)

 **Recursos Criados**
 ------
 - Launch Template
 - Role IAM
 - Instance Profile
 - Security Group
 - Target Group
 - Classic Load Balancer (EBL)
 - Auto Scaling Group (ASG)