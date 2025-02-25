data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["PublicSubnet"]
  }
}

data "aws_security_group" "ssh_access" {
  filter {
    name   = "tag:Name"
    values = ["Allow-SSH"]
  }
}
