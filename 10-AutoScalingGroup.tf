resource "aws_autoscaling_group" "são_paulo_asg" {
  name             = "são_paulo_asg"
  min_size         = 3
  max_size         = 15
  desired_capacity = 6
  vpc_zone_identifier = [
    aws_subnet.private_sa_east_1a.id,
    aws_subnet.private_sa_east_1b.id,
    aws_subnet.private_sa_east_1c.id
  ]
  health_check_type         = "ELB"
  health_check_grace_period = 300
  target_group_arns         = [aws_lb_target_group.são_paulo_tg.arn]

  launch_template {
    id      = aws_launch_template.são_paulo_lt.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  initial_lifecycle_hook {
    name                 = "scale-in-protection"
    lifecycle_transition = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 300
  }

  tag {
    key                 = "Name"
    value               = "São-Paulo-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "são_paulo_policy" {
  name                   = "são_paulo_cpu_target"
  autoscaling_group_name = aws_autoscaling_group.são_paulo_asg.name

  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

resource "aws_autoscaling_attachment" "são_paulo_attachment" {
  autoscaling_group_name = aws_autoscaling_group.são_paulo_asg.name
  lb_target_group_arn    = aws_lb_target_group.são_paulo_tg.arn
}