variable "db_identifier" {
  type    = string
  default = "default_rds"
}

variable "dbname" {
  type    = string
  default = "mysqltestterraform"
}

variable "dbengine" {
  type    = string
  default = "mysql"
}

variable "rds_instance_type" {
  type    = string
  default = "db.t3.micro"
}

variable "engine_version" {
  type    = string
  default = "8.0.35"
}

variable "security_group_name" {
  type    = string
  default = "default_sg"
}

variable "username" {
  type    = string
  default = "admin"
}

variable "password" {
  type    = string
  default = "P@ssw0rd"
}