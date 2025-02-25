# NOTE: This task was originally designed for Azure.
# However, I cannot access Azure, so I am using AWS as an alternative.
# Equivalent AWS resources are used instead of Azure data sources.

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
