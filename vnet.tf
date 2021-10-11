resource "azurerm_resource_group" "ContosoResourceGroup" {
  name     = "ContosoResourceGroup"
  location = "West US"
}

resource "azurerm_virtual_network" "CoreServicesVnet" {
  name                = "CoreServicesVnet"
  resource_group_name = azurerm_resource_group.ContosoResourceGroup.name
  location            = "West US"
  address_space       = [var.address_spaces["CoreServicesVnet"]]

}

resource "azurerm_subnet" "CoreServicesSubnet" {
  count                = length(var.subnet_names["CoreServicesVnet"])
  name                 = var.subnet_names["CoreServicesVnet"][count.index]
  resource_group_name  = azurerm_resource_group.ContosoResourceGroup.name
  address_prefixes     = [var.subnet_prefixes["CoreServicesVnet"][count.index]]
  virtual_network_name = azurerm_virtual_network.CoreServicesVnet.name
}

resource "azurerm_virtual_network" "ManufacturingVnet" {
  name                = "ManufacturingVnet"
  resource_group_name = azurerm_resource_group.ContosoResourceGroup.name
  location            = "North Europe"
  address_space       = [var.address_spaces["ManufacturingVnet"]]
}

resource "azurerm_subnet" "ManufacturingSubnet" {
  count                = length(var.subnet_names["ManufacturingVnet"])
  name                 = var.subnet_names["ManufacturingVnet"][count.index]
  resource_group_name  = azurerm_resource_group.ContosoResourceGroup.name
  address_prefixes     = [var.subnet_prefixes["ManufacturingVnet"][count.index]]
  virtual_network_name = azurerm_virtual_network.ManufacturingVnet.name
}


resource "azurerm_virtual_network" "ResearchVnet" {
  name                = "ResearchVnet"
  resource_group_name = azurerm_resource_group.ContosoResourceGroup.name
  location            = "West India"
  address_space       = [var.address_spaces["ResearchVnet"]]
}

resource "azurerm_subnet" "ResearchSubnet" {
  count                = length(var.subnet_names["ResearchVnet"])
  name                 = var.subnet_names["ResearchVnet"][count.index]
  resource_group_name  = azurerm_resource_group.ContosoResourceGroup.name
  address_prefixes     = [var.subnet_prefixes["ResearchVnet"][count.index]]
  virtual_network_name = azurerm_virtual_network.ResearchVnet.name
}