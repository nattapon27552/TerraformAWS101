db_identifier       = "demo-rds-terraform"
dbname              = "mysqltestterraform"
dbengine            = "mysql"
rds_instance_type   = "db.t3.micro"
engine_version      = "8.0.35"
username            = "admin"
password            = "P@ssw0rd"
security_group_name = "demo-terraformrds-rds-sg"
