output "read-lakehouse-bucket-name" {
  value = module.read-lakehouse.bucket_name
}

output "read-lakehouse-bucket-arn" {
  value = module.read-lakehouse.bucket_arn
}

output "results-lakehouse-bucket-name" {
  value = module.results-lakehouse.bucket_name
}

output "results-lakehouse-bucket-arn" {
  value = module.results-lakehouse.bucket_arn
}

output "crawler-role-arn" {
  value = module.crawler-role.role_arn
}

output "dp-athena-workgroup-name" {
  value = module.data-platform.athena_workgroup_name
}

output "dp-crawler-name" {
  value = module.data-platform.crawler_name
}

output "dp-glue-database-name" {
  value = module.data-platform.glue_database_name
}