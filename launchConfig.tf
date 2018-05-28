resource "aws_launch_configuration" "ecs_launch_configuration" {
  name = "ecs_launch_configuration"
  image_id = "${var.ecs_ami_id}"
  instance_type = "${var.ecs_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.ecs_instance_profile.id}"

  root_block_device {
    volume_type = "standard"
    volume_size = 30
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  security_groups = [
    "${var.pub_sg_id}"]
  associate_public_ip_address = "true"
  key_name = "${var.ecs_key_pair_name}"
  user_data = <<-EOF
    #!/bin/bash
    echo ECS_CLUSTER=${var.ecs_cluster} >> /etc/ecs/ecs.config
  EOF
}
