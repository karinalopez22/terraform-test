resource "ibm_is_vpc" "terraform-vpc" {
  name = "terraform-vpc-2"
  address_prefix_management = "manual"
  resource_group = var.resource_group
}

resource "ibm_is_vpc_address_prefix" "terraformprefix2" {
  name = "terraform-prefix-2"
  zone = "eu-de-1"
  vpc  = ibm_is_vpc.terraform-vpc.id
  cidr = "10.242.0.0/18"
}

resource "ibm_is_subnet" "terraformsubnet1" {
  name            = "terraform-subnet1"
  vpc             = ibm_is_vpc.terraform-vpc.id
  zone            = "eu-de-1"
  ipv4_cidr_block = "10.242.0.0/18"
  resource_group = var.resource_group
  depends_on = [
    ibm_is_vpc_address_prefix.terraformprefix2
  ]
}

resource "ibm_is_vpc_address_prefix" "terraformprefix3" {
  name = "terraform-prefix-3"
  zone = "eu-de-2"
  vpc  = ibm_is_vpc.terraform-vpc.id
  cidr = "10.242.64.0/18"
}

resource "ibm_is_subnet" "terraformsubnet2" {
  name            = "terraform-subnet2"
  vpc             = ibm_is_vpc.terraform-vpc.id
  zone            = "eu-de-2"
  ipv4_cidr_block = "10.242.64.0/18"
  resource_group = var.resource_group
  depends_on = [
    ibm_is_vpc_address_prefix.terraformprefix3
  ]
}
