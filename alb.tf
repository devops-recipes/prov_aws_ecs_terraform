resource "aws_alb" "ecs_load_balancer" {
  name = "ecs_load_balancer"
  security_groups = [
    "${var.pub_sg_id}"]
  subnets = [
    "${var.pub_sn_id}"]

  tags {
    Name = "ecs_load_balancer"
  }
}

resource "aws_alb_target_group" "ecs_target_group" {
  name = "ecs_target_group"
  port = "80"
  protocol = "HTTP"
  vpc_id = "${var.vpc_id}"

  health_check {
    healthy_threshold = "5"
    unhealthy_threshold = "2"
    interval = "30"
    matcher = "200"
    path = "/"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = "5"
  }

  tags {
    Name = "ecs_target_group"
  }
}

resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = "${aws_alb.ecs_load_balancer.arn}"
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.ecs_target_group.arn}"
    type = "forward"
  }
}
