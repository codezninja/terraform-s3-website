variable "site" {
  type        = string
  description = "domain name without cname"
}

variable "index_document" {
  type        = string
  description = "s3 index document"
  default     = "index.html"
}

variable "error_document" {
  type        = string
  description = "s3 error document"
  default     = "error.html"
}

