// AWS Region
variable "region" {
  default = "eu-west-1"
}

variable "az" {
    default = "eu-west-1a"
}

variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "subnets" {
  type = map(string)
  default = {
    public  = "192.168.1.0/24"
    private = "192.168.2.0/24"
  }
}