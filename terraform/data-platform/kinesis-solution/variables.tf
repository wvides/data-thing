variable "vpc_id" {
  type        = string
  description = "The vpc-id for the data-platform account, use here the VPC where the Redshift cluster exists/will be created"
}

variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "route_table_ids" {
  type = list(any)
}

variable "redshift_user" {
  type = string
}

variable "redshift_password" {
  type = string
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

variable "cluster_identifier" {
  type        = string
  description = "The identifier of your cluster"
}

variable "redshift_database" {
  type        = string
  description = "The name of the database in redshift where you want the data to be stored"
}

variable "redshift_port" {
  type        = string
  description = "The port on which you want to connect to your redshift database"
}

variable "data_origin_account_id" {
  type        = string
  description = "The AWS account id of the data origing, this can be retrieved from the AWS console under the support section"
}

variable "redshift_connection_name" {
  type    = string
  default = "redshift-dwh"
}

variable "cross_account_role_arn" {
  description = "An ARN of an account that allows AWS account engineering to assume a role in AWS account data-platform"
  type = string
}