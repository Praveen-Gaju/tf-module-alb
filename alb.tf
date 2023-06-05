#Application load Balancer
resource "aws_lb" "main" {
  name               = "${var.name}-${var.env}"
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  subnets            = var.subnets
  security_groups    = [aws_security_group.main.id]

  enable_deletion_protection = var.enable_deletion_protection

  tags       = merge(
    var.tags,
    { Name = "${var.name}-${var.env}-alb" }
  )
}

#security group
resource "aws_security_group" "main" {
  name        = "${var.name}-${var.env}"
  description = "${var.name}-${var.env}"
  vpc_id      = var.vpc_id

  ingress {
    description      = "APP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.allow_cidr
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags       = merge(
    var.tags,
    { Name = "${var.name}-${var.env}-lb" }
  )
}