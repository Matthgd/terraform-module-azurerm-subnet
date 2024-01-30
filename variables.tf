variable "name" {
  description = "Subnet name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "virtual_network_name" {
  description = "Virtual network name"
  type        = string
}

variable "subnet_cidr_list" {
  description = "The address prefix list to use for the subnet"
  type        = list(string)
}


variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet"
  type        = list(string)
  default     = []
}

variable "enforce_private_link" {
  description = "Enable or Disable network policies for the private link endpoint on the subnet"
  type        = bool
  default     = false
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
