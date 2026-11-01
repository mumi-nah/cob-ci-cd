module "read-lakehouse" {
  source = "git::https://github.com/mumi-nah/project-cob.git//modules/storage?ref=v1.0.0"

  environment    = var.environment
  bucket_purpose = "raw-lh"
}

module "results-lakehouse" {
  source = "git::https://github.com/mumi-nah/project-cob.git//modules/storage?ref=v1.0.0"

  environment    = var.environment
  bucket_purpose = "athena-results-lh"
}

module "crawler-role" {
  source = "git::https://github.com/mumi-nah/project-cob.git//modules/iam?ref=v1.0.0"

  environment     = var.environment
  role_purpose    = "glue-crawler"
  trusted_service = "glue.amazonaws.com"

  policy_statements = [
    {
      sid     = "ReadAppBucket"
      actions = ["s3:GetObject", "s3:ListBucket"]
      resources = [
        module.read-lakehouse.bucket_arn,
        "${module.read-lakehouse.bucket_arn}/*"
      ]
    }
  ]
}


module "data-platform" {
  source = "git::https://github.com/mumi-nah/project-cob.git//modules/data_platform?ref=v1.0.0"

  environment           = var.environment
  data_platform_purpose = "data-platform"
  s3_data_location      = "s3://${module.read-lakehouse.bucket_name}/raw/"
  crawler_role_arn      = module.crawler-role.role_arn
  athena_results_s3_uri = "s3://${module.results-lakehouse.bucket_name}/athena-results/"
}