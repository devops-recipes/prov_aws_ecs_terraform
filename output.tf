output "region" {
  value = "${var.region}"
}

output "ecs_service_role-arn" {
  value = "${aws_iam_role.ecs_service_role.arn}"
}

output "ecs_instance_role-name" {
  value = "${aws_iam_role.ecs_instance_role.name}"
}

//output "ecsLoadBalancer-name" {
//    value = "${aws_alb.ecsLoadBalancer.name}"
//}
//
//output "ecsTargetGroup-arn" {
//    value = "${aws_alb_target_group.ecsTargetGroup.arn}"
//}
