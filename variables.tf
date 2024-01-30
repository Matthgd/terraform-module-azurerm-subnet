variable "location" {
  description = "Location info and alias to resources deploy"
  type = object({
    name  = string
    alias = string
  })
}

variable "delegation" {
  type  = list(object({
  name  = string
  }))
}
variable "service_delegation" {
  type = list(object({
    name              = string
    actions           = string
  }))
}


variable "virtual_network_name" {
  type = string
  description = ""
} 

variable "resource_group_name" {
  type = string
  description = ""
}

variable "address_space" {
  description = "The address prefix list to use for the subnet"
  type        = list(string)
}

variable "name" {
  description = "Subnet name"
  type        = string
}
