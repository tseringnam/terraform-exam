//provider

variable "region" {
  type    = string
  default = "us-east-1"

}

variable "s3_backend_bucket" {
  type    = string
  default = "tsering-backend-s3"

}

variable "s3_bucket_folder" {

  type    = string
  default = "terraform-state"
}

//s3
variable "bucket_name" {
  description = "name of the team to assign the name of the bucket"
  type        = string
  default     = "tsering-terraform-exam1"
}


variable "s3_tag" {
  type = map(string)
  default = {
    Name        = "My bucket"
    Environment = "dev"
  }
}

variable "s3_version_status" {
  type    = string
  default = "Enabled"


}

variable "s3_encryption_type" {
  type    = string
  default = "AES256"

}

//ec2
variable "ec2_ami_id" {
  description = "AMI Id of the Ec2 instance "
  type        = string
  default     = "ami-053a45fff0a704a47"

}

variable "key_name" {
  description = "Key name of the ec2 instance"
  type        = string
  default     = "tsering-keypair"

}

variable "instance_type" {
  description = "type of Instance"
  type        = string
  default     = "t2.micro"
}

variable "associate_public_ip_address" {
  type    = bool
  default = true

}

variable "secondary_private_ips" {
  type    = list(string)
  default = null
}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name = "ec2-example"

  }

}

//iam 

variable "role_name" {
  type    = string
  default = "ec2_role_to_test_s3_access"

}

variable "ec2_policy_name" {
  type    = string
  default = "test_policy_for_ec2_for_s3_access"
}

variable "ec2_policy_attachment_name" {
  type    = string
  default = "test-attachment"
}


//sg
variable "sg_name" {
  type    = string
  default = "allow_tls"

}

variable "sg_tag" {
  type = map(string)
  default = {
    Name = "allow_tls"
  }
}

variable "sg_ingerss_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}

variable "sg_ingress_from_port" {
  type    = number
  default = 22
}
variable "sg_ingres_protocol" {
  type    = string
  default = "tcp"

}

variable "sg_ingress_to_port" {
  type    = number
  default = 22
}

variable "sg_engress_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}

variable "sg_egerss_ip_protocol" {
  type    = string
  default = "-1"
}

variable "security_group_id" {
  type    = string
  default = "sg-0658e2b76581050a2"

}

//subnet 

variable "public_subnet_cidr_block" {
  type    = string
  default = "10.10.1.0/24"

}

variable "private_subnet_cidr_block" {
  type    = string
  default = "10.10.2.0/24"

}

variable "subnet_tag_public" {
  type = map(string)
  default = {
    Terraform = "True"
    Name      = "public"
  }
}

variable "subnet_tag_private" {
  type = map(string)
  default = {
    Terraform = "True"
    Name      = "private"
  }
}

//vpc
variable "vpc_cidr_block" {
  type    = string
  default = "10.10.0.0/16"

}

variable "vpc_tag" {
  type = map(string)
  default = {
    Terraform = "True"
    Name      = "ziyo_vpc"
  }
}

variable "route_table_cidr_block" {
  type    = string
  default = "0.0.0.0/0"

}
variable "rt_tag" {
  type = map(string)
  default = {
    Name = "ziyo_rt"
  }


}