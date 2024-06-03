# Create an EC2 Auto Scaling Group - app
resource "aws_autoscaling_group" "app-asg" {
  name                 = "app-asg"
  launch_configuration = aws_launch_configuration.app-lconfig.id
  vpc_zone_identifier  = [aws_subnet.pvt-sub-1.id, aws_subnet.pvt-sub-2.id]
  min_size             = 2
  max_size             = 4
  desired_capacity     = 2
}

# Create a launch configuration for the EC2 instances
resource "aws_launch_configuration" "app-lconfig" {
  name_prefix                 = "app-lconfig"
  image_id                    = "ami-0b3a4110c36b9a5f0"
  instance_type               = "t2.micro"
  key_name                    = "singapore"
  security_groups             = [aws_security_group.ssh-security-group.id]
  user_data                   = <<-EOF
                                #!/bin/bash

                                sudo yum install mysql -y

                                EOF
                                
  associate_public_ip_address = false
  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}