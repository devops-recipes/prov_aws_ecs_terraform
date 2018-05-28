resource "aws_autoscaling_group" "ecs_autoscaling_group" {
  name = "ecs_autoscaling_group"
  max_size = "${var.max_instance_size}"
  min_size = "${var.min_instance_size}"
  desired_capacity = "${var.desired_capacity}"
  vpc_zone_identifier = [
    "${var.pub_sn_id}"]
  launch_configuration = "${aws_launch_configuration.ecs_launch_configuration.name}"
  health_check_type = "EC2"
}
