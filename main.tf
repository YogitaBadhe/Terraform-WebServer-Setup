 terraform { 
   required_providers { 
     aws = { 
       source  = "hashicorp/aws" 
       version = "5.81.0" 
     } 
   } 
 } 
  
 provider "aws" { 
   region = "us-east-1"  # Replace with your desired region 
 } 
  
  
 resource "aws_default_vpc" "default" { 
  
 } 
  
 resource "aws_security_group" "Terraform_Webserver" { 
   name   = "Terraform_Webserver" 
   vpc_id = "vpc-0f5fd76a87a2fe3c4" 
  
  
   ingress { 
     from_port   = 80 
     to_port     = 80 
     protocol    = "tcp" 
     cidr_blocks = ["0.0.0.0/0"] 
   } 
  
   ingress { 
     from_port   = 22 
     to_port     = 22 
     protocol    = "tcp" 
     cidr_blocks = ["0.0.0.0/0"] 
   } 

   ingress { 
     from_port   = 443 
     to_port     = 443 
     protocol    = "tcp" 
     cidr_blocks = ["0.0.0.0/0"] 
   } 
  
   egress { 
     from_port   = 0 
     to_port     = 0 
     protocol    = -1 
     cidr_blocks = ["0.0.0.0/0"] 
   } 
  
   tags = { 
     name = "Terraform_Webserver" 
   } 
 } 
  
 resource "aws_instance" "http_server" { 
   ami                    = "ami-0453ec754f44f9a4a" 
   key_name               = "TerraformWebserver" 
   instance_type          = "t2.medium" 
   subnet_id              = "subnet-0bdc7d15923d3bb6e" 
   vpc_security_group_ids = [aws_security_group.Terraform_Webserver.id] 
   associate_public_ip_address = true 
  
   connection { 
     type        = "ssh" 
     host        = self.public_ip 
     user        = "ec2-user" 
     private_key = file(var.aws_key_pair) 
   } 
  
   provisioner "remote-exec" { 
     inline = [ 
       "sudo yum update -y", 
       "sudo yum install httpd -y", 
       "sudo systemctl start httpd", 
       "sudo systemctl enable httpd", 
       "sudo usermod -a -G apache ec2-user", 
       "sudo chmod 777 /var/www/html", 
       "cd /var/www/html", 
       "echo Welcome to Webserver ${self.public_dns} | sudo tee /var/www/html/index.html" 
     ] 
   } 
 } 
