# variables.tf

variable "accessKey" {
 default = "insira aqui sua access key aws"
}

variable "secretKey" {
 default = "insira aqui sua secret key aws"
}

variable "region" {
 default = "us-west-1"
}

variable "availabilityZone" {
        default = "us-west-2a"
}

variable "instanceTenancy" {
 default = "default"
}

variable "dnsSupport" {
 default = true
}

variable "dnsHostNames" {
        default = true
}

variable "vpcCIDRblock" {
 default = "10.0.0.0/16"
}

variable "subnetCIDRblock" {
        default = "10.0.1.0/24"
}

variable "destinationCIDRblock" {
        default = "0.0.0.0/0"
}

variable "ingressCIDRblock" {
        type = "list"
        default = [ "0.0.0.0/0" ]
}

variable "mapPublicIP" {
        default = true
}

# end of variables.tf

