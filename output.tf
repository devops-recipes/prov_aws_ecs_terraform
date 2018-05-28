output "region" {
  value = "${var.region}"
}

output "ecs_service_role-arn" {
  value = "${aws_iam_role.ecs_service_role.arn}"
}

output "ecs_instance_role-name" {
  value = "${aws_iam_role.ecs_instance_role.name}"
}

output "ecs_load_balancer-name" {
    value = "${aws_alb.ecs_load_balancer.name}"
}

output "ecs_target_group-arn" {
    value = "${aws_alb_target_group.ecs_target_group.arn}"
}
