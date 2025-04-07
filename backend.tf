terraform {
  backend "azurerm" {
    resource_group_name  = "ynov-web"
    storage_account_name = "ynovtfsbayidi"
    container_name       = "tfstate"
    key                  = "ynov1.tfstate"
    tenant_id            = "38e72bba-3c22-4382-9323-ac1612931297"
    subscription_id      = "1f9ebda8-cfd5-4105-b792-44949b11144e"
  }
}