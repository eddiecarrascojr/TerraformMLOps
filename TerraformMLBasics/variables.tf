variable "resource_group_location" {
  type        = string
  default     = "westus"
  description = "Location of the resource group."
}

variable "azure_rg_name" {
  type        = string
  default     = "ml-rg-yourfakecompany-co-prod"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}