variable "region" {
  default     = "us-east-2"
  type        = string
  description = "Regiao para VPC"
}

variable "cidr_block" {
  default     = "172.16.0.0/16"
  type        = string
  description = "Blocos de IPs utilizados na VPC"
}

variable "subnet_cidr_blocks" {
  default     = ["172.16.0.0/20","172.16.16.0/20"]
  type        = list
  description = "Subnets"
}

variable "availability_zones" {
  default     = ["us-east-2a", "us-east-2b"]
  type        = list
  description = "Zonas de disponibilidade"
}

variable "ami_amazon" {
  default     = "ami-0603cbe34fd08cb81"
  type        = string
  description = "AMI Amazon Linux 2"
}

variable "instance_type" {
  default     = "t2.micro"
  type        = string
  description = "Tipo da instancia"
}