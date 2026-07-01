resource "aws_s3_bucket" "firstbucket" {
 
  bucket = "anirudh-1204"
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket                  = aws_s3_bucket.firstbucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "allow_cf_only" {
  bucket = aws_s3_bucket.firstbucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontServicePrincipal"
        Effect    = "Allow"
        Principal = { Service = "cloudfront.amazonaws.com" }
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.firstbucket.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.s3_distribution.arn
          }
        }
      }
    ]
  })
}

resource "aws_s3_object" "upload_index" {
  bucket       = aws_s3_bucket.firstbucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}