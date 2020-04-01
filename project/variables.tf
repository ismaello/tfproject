variable "environment_name" {
   
}

variable "yaml_to_install" {
    type = list(string)
}
variable "nodes" {
  type = list(object({
    name    = string,
    address = string,
    ssh_user    = string,
    ssh_key_path    = string,
    port    =   number
    role    = list(string)
  }))
  
}