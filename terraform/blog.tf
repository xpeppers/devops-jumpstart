provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "eu-central-1"
}

resource "aws_security_group" "blog" {
    name = "${var.name}-devops-jumpstart-blog"
    description = "Security group for web that allows web traffic from internet"

    ingress {
        from_port = 80
        to_port   = 80
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "blog" {
    instance_type = "t2.micro"
    ami = "${var.ami}"
    key_name = "devops-jumpstart"
    security_groups = ["${aws_security_group.blog.name}"]

    tags {
      Name = "${var.name} devops-jumpstart blog"
    }
}

output "ip" {
    value = "${aws_instance.blog.public_ip}"
}
