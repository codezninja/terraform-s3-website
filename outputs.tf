output "main_bucket" {
  value = aws_s3_bucket.main_bucket
}

output "staging_bucket" {
  value = aws_s3_bucket.staging_bucket
}

output "naked_bucket" {
  value = aws_s3_bucket.naked_bucket
}