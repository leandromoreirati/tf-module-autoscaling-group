/* AUTO SCALING GROUP */
output "auto_scaling_group_arn" {
  value = "${aws_autoscaling_group.auto_scaling_group.arn}"
}

output "auto_scaling_group_id" {
  value = "${aws_autoscaling_group.auto_scaling_group.id}"
}

output "auto_scaling_group_name" {
  value = "${aws_autoscaling_group.auto_scaling_group.name}"
}