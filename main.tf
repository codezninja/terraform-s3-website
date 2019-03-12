data "template_file" "s3_public_read" {
  template = "${file("${path.module}/policy.json")}"
  vars {
    site = "${var.site}"
  }
}

resource "aws_s3_bucket" "main_bucket" {
  bucket = "www.${var.site}.com"
  acl    = "public-read"
  policy = "${data.template_file.s3_public_read.rendered}"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket" "staging_bucket" {
  bucket = "staging.${var.site}.com"
  acl    = "public-read"
  policy = "${data.template_file.s3_public_read.rendered}"

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