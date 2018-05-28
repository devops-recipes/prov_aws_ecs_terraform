//resource "aws_alb" "ecsLoadBalancer" {
//  name = "ecsLoadBalancer"
//  security_groups = [
//    "${var.pub_sg_id}"]
//  subnets = [
//    "${var.pub_sn_id}"]
//
//  tags {
//    Name = "ecsLoadBalancer"
//  }
//}
//
//resource "aws_alb_target_group" "ecsTargetGroup" {
//  name = "ecsTargetGroup"
//  port = "80"
//  protocol = "HTTP"
//  vpc_id = "${var.vpc_id}"
//
//  health_check {
//    healthy_threshold = "5"
//    unhealthy_threshold = "2"
//    interval = "30"
//    matcher = "200"
//    path = "/"
//    port = "traffic-port"
//    protocol = "HTTP"
//    timeout = "5"
//  }
//
//  tags {
//    Name = "ecsTargetGroup"
//  }
//}
//
//resource "aws_alb_listener" "alb_listener" {
//  load_balancer_arn = "${aws_alb.ecsLoadBalancer.arn}"
//  port = "80"
//  protocol = "HTTP"
//
//  default_action {
//    target_group_arn = "${aws_alb_target_group.ecsTargetGroup.arn}"
//    type = "forward"
//  }
//}
