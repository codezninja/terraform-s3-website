data "template_file" "s3_public_read_www" {
  template = "${file("${path.module}/policy.json")}"
  vars = {
    site = "${var.site}"
    cname = "www"
  }
}

resource "aws_s3_bucket" "main_bucket" {
  bucket = "www.${var.site}.com"
  acl    = "public-read"
  policy = "${data.template_file.s3_public_read_www.rendered}"

  website {
    index_document = "${var.index_document}"
    error_document = "${var.error_document}"
  }
}

data "template_file" "s3_public_read_staging" {
  template = "${file("${path.module}/policy.json")}"
  vars = {
    site = "${var.site}"
    cname = "staging"
  }
}

resource "aws_s3_bucket" "staging_bucket" {
  bucket = "staging.${var.site}.com"
  acl    = "public-read"
  policy = "${data.template_file.s3_public_read_staging.rendered}"

  website {
    index_document = "${var.index_document}"
    error_document = "${var.error_document}"
  }
}

resource "aws_s3_bucket" "naked_bucket" {
  bucket = "${var.site}.com"
  website {
    redirect_all_requests_to = "${aws_s3_bucket.main_bucket.bucket}"
  }
}
