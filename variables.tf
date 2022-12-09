variable "ami" {
    type = string
}
variable "instance_type" {
    type = string
}
variable "product" {
    type = string
}
variable "environment" {
    type = string
}
variable "key_name" {
    type = string
}

variable "vpc_id" {
    type = string
}

#variable "az" {
 #   type = string
#}

variable "ec2_ebs_volume_size" {
  type        = list(any)
  default = [
    10
  ]
}

variable "ec2_device_names" {
  type = list(any)
  default = [
    "/dev/sdd"
  ]
}

variable "ec2_count" {
    type = number
    default = 1
}

variable "ebs_volume_count" {
  type        = number
  default     = 0
}

variable "availability_zones" {
  type        = list(any)
  default = {}
    
}

variable "subnet_ids" {
  type        = list(any)
}

variable "terraform_repo" {
  type = string
}

variable "costcode" {
  type = number
}




