terraform {
  # Configure state backend
  backend "azurerm" {
    resource_group_name   = "tfstate-rg"
    storage_account_name  = "tfstate19049"
    container_name        = "tfstate"
  }
}

# pinning to v2.0.0 of the Azure provider
provider "azurerm" {
  version = "=2.0.0"
  subscription_id = "${var.subscription_id}"
  features {}
}

# Create resource group
resource "azurerm_resource_group" "webapp" {
  name = "${var.prefix}-rg"
  location = "${var.location}"

  tags {
      environment = "${var.environment}"
  }
}

# Create app service plan
resource "azurerm_app_service_plan" "webapp" {
    name = "${var.prefix}-asp"
    location = "azurerm_resource_group.webapp.location"
    resource_group_name = "azurerm_resource_group.webapp.name"
    kind = "${var.kind}"
    reserved = "${var.reserved}"
    sku {
        tier = "${var.sku_tier}"
        size = "${var.sku_size}"
    }
}

# Create app service web app
resource "azurerm_app_service" "webapp" {
    name = "${var.prefix}-app"
    location = "azurerm_resource_group.webapp.location"
    resource_group_name = "azurerm_resource_group.webapp.name"
    app_service_plan_id = "azurerm_app_service_plan.webapp.id"
}