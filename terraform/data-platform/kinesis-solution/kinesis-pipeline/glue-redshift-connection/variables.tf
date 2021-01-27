variable "cluster_identifier" {
  type = string
  description = "The identifier of your cluster"
}

variable "redshift_user" {
  type = string
}

variable "redshift_password" {
  type = string
}

variable "glue_redshift_connection_name" {
  type = string
  default = "redshift-dwh"
  description = "The name that you want this glue-redshift connection to have"
}

variable "redshift_database" {
  type = string
  description = "The name of the database in redshift where you want the data to be stored"
}

variable "redshift_port" {
  type = string
  description = "The port that will be used to connect to the database"
}

variable "security_group_id_list" {
  type        = list(any)
  description = "A security group id list, could be one or more"
}

variable "subnet_id" {
  type        = string
  description = "The id of one the subnets in your vpc, this should match the vpc defined on vpc_id and should be the same vpc where your redshift cluster is"
}

variable "availability_zone" {
  type        = string
  description = "The AZ (Availability zone where the subnet (subnet_id) you picked exists"
}