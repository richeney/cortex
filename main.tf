provider "azurerm" {
  version = "~> 1.33.1"
}

resource "azurerm_resource_group" "mp_rg" {
   name         = "${var.mprg}"
   location     = "${var.loc}"
   tags         = "${var.tags}"
}

resource "azurerm_storage_account" "mp_rg_sa" {
  name                     = "${var.mpsa}"
  resource_group_name      = "${var.mprg}"
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}