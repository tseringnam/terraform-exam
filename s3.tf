
resource "aws_s3_bucket" "ziyotek_bucket" {
  bucket = var.bucket_name

  tags = var.s3_tag

}


# //version

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.ziyotek_bucket.id
  versioning_configuration {
    status = var.s3_version_status
  }
}

# //ecrption 

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.ziyotek_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

