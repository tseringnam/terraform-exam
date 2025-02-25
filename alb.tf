resource "aws_launch_configuration" "as_conf" {
  name                        = "web_config"
  image_id                    = data.aws_ami.example.image_id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.allow_tls.id]
  key_name                    = aws_key_pair.my_key.key_name
  user_data                   = file("efs-web.sh")
}

resource "aws_autoscaling_group" "bar" {
  name                 = "web_tier_group"
  max_size             = 3
  min_size             = 1
  desired_capacity     = 2
  force_delete         = false
  launch_configuration = aws_launch_configuration.as_conf.name
  vpc_zone_identifier  = [aws_subnet.ziyo_subnet_public.id]

}

resource "aws_lb_target_group" "web_tg" {
  name     = "web-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.ziyo_vpc.id
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = "traffic-port"
    matcher             = "200-300"
  }
}

# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "web_attach" {
  autoscaling_group_name = aws_autoscaling_group.bar.id
  lb_target_group_arn    = aws_lb_target_group.web_tg.arn
}

//load balancer 

resource "aws_lb" "web_tier_alb" {
  name               = "web-tier-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_tls.id]
  subnets = [
    aws_subnet.ziyo_subnet_public.id,
    aws_subnet.ziyo_subnet_public_2.id
  ]

  enable_deletion_protection = false
}


resource "aws_lb_listener" "web-lb-listner" {
  load_balancer_arn = aws_lb.web_tier_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}


resource "aws_lb_listener_rule" "web-rule" {
  listener_arn = aws_lb_listener.web-lb-listner.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }

  condition {
    path_pattern {
      values = ["/web/*"]
    }
  }
}


#############################################

resource "aws_lb_target_group" "static-tg" {
  name     = "web-tier-tg-static"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.ziyo_vpc.id
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = "traffic-port"
    matcher             = "200-300"
  }
}


resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.static-tg.arn
  target_id        = aws_instance.web.id
  port             = 80
}



resource "aws_lb_listener_rule" "static-rule" {
  listener_arn = aws_lb_listener.web-lb-listner.arn
  priority     = 500

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.static-tg.arn
  }

  condition {
    path_pattern {
      values = ["/static/*"]
    }
  }
}