resource "aws_instance" "tfi-apache" {
    ami = "ami-0b0ea68c435eb488d"
    instance_type = "t2.micro"
  
    subnet_id = "${aws_subnet.tfsub.id}"
    vpc_security_group_ids = ["${aws_security_group.tfsg.id}"]
    key_name = "mykeypair"
    
    user_data = <<-EOF
    #!/bin/bash
    echo "Installing apache2"
    sudo apt update -y
    sudo apt install apache2 -y
    echo "Install completed"
    EOF

    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
}
