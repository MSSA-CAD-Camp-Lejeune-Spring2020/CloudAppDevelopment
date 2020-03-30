variable "prefix" {
    type = string
    default = "lejeune"
}

variable "subscription_id" {
    type = string
}

variable "location" {
    type = string
    default = "Central US"
}

variable "environment" {
    type = string
    default = "Production"
}

variable "kind" {
    type = string
    default = "Linux"
}

variable "sku_tier" {
    type = string
    default = "Basic"
}

variable "sku_size" {
    type = string
    default = "B1"
}

variable "reserved" {
    type = bool
    default = true
}