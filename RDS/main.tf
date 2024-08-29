# Create Security Group
resource "aws_security_group" "demo-rds-sg" {
  name        = var.security_group_name
  description = "Created By Terraform"
  vpc_id      = "vpc-00000000000000000"
  
  #HomeN
  ingress {
    description = "Home N"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["xxx.xxx.xxx.xxx/32"]
  }

  #Outbound rules
  egress {
    description = "All IPv4"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create DB Subnet Group
resource "aws_db_subnet_group" "rds-pvt-subnet" {
  name        = "rds-pvt-subnet"
  description = "Subnet group for RDS"

  subnet_ids = [
    "subnet-01aaaaaaaaaaaaaa",
    "subnet-02bbbbbbbbbbbbbb",
    "subnet-03cccccccccccccc"
  ]

  tags = {
    Name = "rds-pvt-subnet"
  }
}

resource "aws_db_instance" "aws_rds" {
  allocated_storage      = 20
  identifier             = var.db_identifier
  db_name                = var.dbname
  engine                 = var.dbengine
  engine_version         = var.engine_version
  instance_class         = var.rds_instance_type
  username               = var.username
  password               = var.password
  publicly_accessible    = true
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.demo-rds-sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds-pvt-subnet.name
}