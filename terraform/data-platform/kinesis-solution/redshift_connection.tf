module "redshift-connection" {
  source                        = "./kinesis-pipeline/glue-redshift-connection"
  cluster_identifier            = var.cluster_identifier
  redshift_user                 = var.redshift_user
  redshift_password             = var.redshift_password
  glue_redshift_connection_name = var.redshift_connection_name
  redshift_database             = "dev"
  redshift_port                 = "5439"
  availability_zone             = var.availability_zone
  security_group_id_list        = var.security_group_id_list
  subnet_id                     = var.subnet_id
}