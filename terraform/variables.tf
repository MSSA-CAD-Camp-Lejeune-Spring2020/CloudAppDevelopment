variable "prefix" {
    type = "string"
    default = "lejeune"
}

variable "subscription_id" {
    type = "string"
}

variable "location" {
    type = "string"
    default = "Central US"
}

variable "environment" {
    type = "string"
    default = "Production"
}

variable "kind" {
    type = "string"
    default = "Linux"
}

variable "sku_tier" {
    type = "string"
    default = "Basic"
}

variable "sku_size" {
    type = "string"
    default = "B1"
}

variable "reserved" {
    type = "bool"
    default = true
}

variable "backend_key" {
    type = "string"
}

variable "backend_rg" {
    type = "string"
    default = "tfstate-rg"
}

variable "backend_container_name" {
    type = "string"
    default = "tfstate"
}

variable "backend_storage_account_name" {
    type = "string"
    default = "tfstate19049"
}