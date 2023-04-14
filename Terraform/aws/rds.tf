resource "aws_rds_cluster" "app1-rds-cluster" {
  cluster_identifier = "app1-rds-cluster"
  allocated_storage       = 10
  backup_retention_period = 15
}
