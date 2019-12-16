locals {
    files_list = [
        "${md5(file("${path.module}/main.tf"))}",
        "${md5(file("${path.module}/output.tf"))}",
        "${md5(file("${path.module}/variables.tf"))}",
    ]
    current_deployment = "${join("", local.files_list)}"
}

resource "aws_autoscaling_group" "auto_scaling_group" {
  name                       = "asg-${var.name}"
  vpc_zone_identifier        = ["${var.private_subnet}"]
  availability_zones         = ["${var.azs}"]
  wait_for_capacity_timeout  = "10m"
  /* depends_on = ["aws_launch_template.instance-template-spot"] */
   
  force_delete              = true
               
/*   target_group_arns         = ["${var.target_group_arns}"]

  load_balancers = [
                    "${var.load_balancers}"
                   ] */

  enabled_metrics           = [
                                "GroupMinSize",
                                "GroupMaxSize",
                                "GroupDesiredCapacity",
                                "GroupInServiceInstances",
                                "GroupPendingInstances",
                                "GroupStandbyInstances",
                                "GroupTerminatingInstances",
                                "GroupTotalInstances",
                              ]

  #min_elb_capacity   = "${var.asg_min}" # So habilitar com ELB
  max_size           = "${var.asg_max}"
  min_size           = "${var.asg_min}"
  desired_capacity   = "${var.environment == "production" ? var.asg_desired : 1}"

  health_check_grace_period = 300  
  health_check_type         = "EC2"
 
  mixed_instances_policy {
   
      launch_template {
        launch_template_specification {
          launch_template_id = "${var.launch_template_id}"
          version = "${var.launch_template_version}"
        }    

/*         override {
          instance_type = "t2.nano"
        }

        override {
         instance_type = "t2.micro"
        } */
      }      

      instances_distribution {
        on_demand_allocation_strategy            = "${var.on_demand_allocation_strategy}"
        on_demand_base_capacity                  = "${var.environment == "production" || var.environment == "sandbox" ? var.on_demand_base_capacity : 1 }"
        on_demand_percentage_above_base_capacity = "${var.environment == "production" ? var.on_demand_percentage_above_base_capacity : 0 }"
        spot_allocation_strategy                 = "${var.spot_allocation_strategy}"
      }          
   }   

  lifecycle {
     create_before_destroy = true
   }

  tags = "${ list(var.tags) }"

}