
resource "aws_s3_bucket" "ziyotek_bucket" {
  bucket = "tsering-terraform-exam"

  tags = {
    Name        = "My bucket"
    Environment = "Ziyp"
  }
}


//version

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.ziyotek_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

//ecrption 

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.ziyotek_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

