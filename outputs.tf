output "main_bucket" { value = "${aws_s3_bucket.main_bucket.bucket}" }
output "main_bucket_website_endpoint" { value = "${aws_s3_bucket.main_bucket.website_endpoint}" }