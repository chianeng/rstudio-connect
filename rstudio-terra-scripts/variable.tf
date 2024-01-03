variable aws_region {
    default = "us-east-1"
    type = string
    description = "Enter the region of the infrastructure"
}

variable aws_profile {
    default = "default"
    type = string
    description = "aws account profile"
}
variable env {
  type        = string
  default     = "dev"
  description = "locals vars"
}

variable team {
  type        = string
  default     = "alpha"
  description = "locals vars"
}

variable vpc_name {
  type        = string
  default     = "rstudio"
  description = "vpc name"
}

variable vpc_cidr {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr"
}

variable public_cidr {
  type        = string
  default     = "10.0.1.0/24"
  description = "public subnet cidr"
}

variable private_cidr {
  type        = string
  default     = "10.0.4.0/24"
  description = "private subnet cidr"
}


variable azs {
  type        = list
  default     = ["us-east-1a","us-east-1b"]
  description = "availability zones"
}

variable app_server1_instance_name {
  type        = string
  default     = "app-server"
  description = "description"
}

variable app_server1_ami {
  type        = string
  default     = "ami-0261755bbcb8c4a84"
  description = "app-server ami"
}

variable app_server1_instance_type {
  type        = string
  default     = "t2.medium"
  description = "app-server instance ami"
}
