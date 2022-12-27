resource "random_pet" "random_values" {}

variable "config" {
  type = map(string)

  default = {
    "location" = "aus-east"
  }
}

# Need to add resource group for Terraform
resource "azurerm_resource_group" "resource_group" {
  name     = "rg-threeteir-${random_pet.random_values.id}"
  location = "${var.config.location}"
}