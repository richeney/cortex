
variable "mprg" {
    default = "hack1mprg" // marketing portal resource group name
}

variable "mpsa" {
   default = "hack1mpsa" // marketing portal service account name
}

variable "loc" {
    default = "West Europe"
}

variable "tags" {
    type = "map"
    default = {
        environment = "training"
        source      = "citadel"
    }
}