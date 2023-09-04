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

variable "fgt_ami" {
  //ami for FGT 7.2.5 VM64 eu-west-1 region (Ireland) - Ideally this would be an object that would be updated to return the correct ami for a region/version/arch
  //The public FTNT repo has a great implementation for this. Simplifying here for demo 
  default = "ami-089190cb9700b1ce1"
}

variable "size" {
  //Smallest instance available to run
  default = "t3.small"
}

// License Type - either byol or payg.
variable "license_type" {
  default = "payg"
}

// BYOL license - Referenced in the bootstrap config
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

variable "bootstrap-fgt" {
  type    = string
  default = "fgt.conf"
}

variable "adminsport" {
  default = "8443"
}

variable "fgt-hostname" {
  default = "FGT-DEMO"
}

variable "pub_key" {
  type    = string
  default = "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAC9EF2NLg8WeTL5nQz0voO/paM6QrjU0eXUaoUnKLRhNhxG9sO7t7v7rEs2iNVHKui8FP/R2Msr9PonYeZv5Er8UABXrfFdnoU0fqVb2zv+rKm8AS6aMX8XuCCBSEWNluWcUEbtJWYTrk4X/8BYt3d7qeEc2mThLNCux46h3AnfVu8gPg=="
}

variable "fgt-admin-user" {
  default = "admin-nc"
}

variable "fgt-admin-password" {
  default = "SH2CxAQ83a3PCE8awbUJPqbjFHeJr9SRIN7r7AzBeY5hc2ug+spQA5m2UzFwd8="
}

variable "fgt-api-user" {
  default = "terraform-api-user"
}

variable "fgt-api-key" {
  //Due to the process of creation of the API user not allowing an easy automation, we use a workaround for example sake:
  //We generate a default key in another firewall and use it in the default config file
  //Then, we change it using the FortiOS provider and the autoscript resource (fortios_syste_autoscript) on the first access.
  //Same process we used for the password
  //As an example, the decrypted key is "p8Nzgp8cN1zz5c4qqykgtjNtkm0wkG" which is inserted in the config as "SH2on+oUrJA8d7dTTuPZwgHtBpUAypeaHbcZsmNneY/ZVnEZqQHYlwTKsN8lrw="
  default = "SH2on+oUrJA8d7dTTuPZwgHtBpUAypeaHbcZsmNneY/ZVnEZqQHYlwTKsN8lrw="
}