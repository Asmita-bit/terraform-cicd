output "s3_bucket_name" {
  value = module.s3_store.bucket_name
}

output "instance_id" {
  value = module.instance_template.instance_id
}