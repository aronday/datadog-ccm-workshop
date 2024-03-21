#AWS SGs - DEV
resource "aws_security_group" "node_group_one_dev" {
  name_prefix = "node_group_one_dev"
  vpc_id      = module.vpc-storedog-dev.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "192.168.0.0/16",
    ]
  }
}