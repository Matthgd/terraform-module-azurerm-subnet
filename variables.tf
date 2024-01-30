variable "location" {
  type = string
}

#variable "delegation" {
#  type  = list(object({
#  name  = string
#  }))
#}
#variable "service_delegation" {
#  type = list(object({
#    name              = string
#    actions           = string
#  }))
#}


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

variable "subnet_delegation" {
  type = list(object({
    name = string
    subnet_delegation = list(object({
      name    = string
      actions = list(string)
    }))
  }))
  default = []
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet"
  type        = list(string)
  default     = []
}