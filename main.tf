resource "aws_s3_bucket" "main_bucket" {
  bucket = "www.${var.site}.com"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket" "naked_bucket" {
  bucket = "${var.site}.com"
  website {
    redirect_all_requests_to = "${aws_s3_bucket.main_bucket.bucket}"
  }
}