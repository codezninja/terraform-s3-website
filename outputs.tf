output "main_bucket" { value = "${aws_s3_bucket.main_bucket.bucket}" }
output "main_bucket_website_endpoint" { value = "${aws_s3_bucket.main_bucket.website_endpoint}" }
output "main_bucket_hosted_zone_id" { value = "${aws_s3_bucket.main_bucket.hosted_zone_id}" }