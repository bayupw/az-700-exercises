variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "address_spaces" {
  default = {
    CoreServicesVnet  = "10.20.0.0/16"
    ManufacturingVnet = "10.30.0.0/16"
    ResearchVnet      = "10.40.0.0/16"
  }
}

variable "subnet_names" {
  default = {
    CoreServicesVnet  = ["GatewaySubnet", "SharedServicesSubnet", "DatabaseSubnet", "PublicWebServiceSubnet"]
    ManufacturingVnet = ["ManufacturingSystemSubnet", "SensorSubnet1", "SensorSubnet2", "SensorSubnet3"]
    ResearchVnet      = ["ResearchSystemSubnet"]
  }
}


variable "subnet_prefixes" {
  default = {
    CoreServicesVnet  = ["10.20.0.0/27", "10.20.10.0/24", "10.20.20.0/24", "10.20.30.0/24"]
    ManufacturingVnet = ["10.30.10.0/24", "10.30.20.0/24", "10.30.21.0/24", "10.30.22.0/24"]
    ResearchVnet      = ["10.40.0.0/24"]
  }
}