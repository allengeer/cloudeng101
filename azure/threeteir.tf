resource "random_pet" "random_values" {}

variable "config" {
  type = "map"

  default = {
    "user_pets" = "${random_pet.random_values.id}"
    "location" = "aus-east"
  }
}

# Need to add resource group for Terraform
resource "azurerm_resource_group" "resource_group" {
  name     = "rg-threeteir-${var.config.user_pets}"
  location = "${var.config.location}"
}