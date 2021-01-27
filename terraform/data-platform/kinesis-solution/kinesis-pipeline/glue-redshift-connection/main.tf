data "aws_redshift_cluster" "redshift_cluster" {
  cluster_identifier = var.cluster_identifier
}

resource "aws_glue_connection" "redshift-dwh" {
  connection_properties = {
    JDBC_CONNECTION_URL = "jdbc:redshift://${data.aws_redshift_cluster.redshift_cluster.endpoint}:${var.redshift_port}/${var.redshift_database}"
    PASSWORD            = var.redshift_password
    USERNAME            = var.redshift_user
  }

  name = var.glue_redshift_connection_name

  physical_connection_requirements {
    availability_zone      = var.availability_zone
    security_group_id_list = var.security_group_id_list
    subnet_id              = var.subnet_id
  }
}