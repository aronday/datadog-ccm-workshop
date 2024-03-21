#AWS SGs - PROD
resource "aws_security_group" "node_group_one_prod" {
  name_prefix = "node_group_one_prod"
  vpc_id      = module.vpc-storedog-prod.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "192.168.0.0/16",
    ]
  }
}