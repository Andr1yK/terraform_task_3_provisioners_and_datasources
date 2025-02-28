# NOTE: Since Azure is not available to me, this solution uses AWS.
# The EC2 instance replaces an Azure Virtual Machine.
# AWS security groups replace Azure NSGs.
# AWS S3 can replace Azure Blob Storage if needed.

resource "aws_instance" "web" {
  ami                         = "ami-035f91feb765a0ee1" # Update for your region
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  subnet_id                   = data.aws_subnet.public.id
  security_groups             = [data.aws_security_group.ssh_access.id]
  associate_public_ip_address = true

  tags = {
    Name = "WebServer"
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    password = "SuperSecretPassword123!"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y nginx",
      "sudo chown -R ubuntu:ubuntu /var/www/html/",
      "sudo chmod -R 755 /var/www/html/",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }

  provisioner "file" {
    source      = "index.html"
    destination = "/var/www/html/index.html"
  }
}
