resource "aws_s3_bucket" "main_bucket" {
  bucket = "www.${var.site}.com"
  acl    = "public-read"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AddPerm",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::www.$${var.site}.com/*"
            ]
        }
    ]
}
EOF

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