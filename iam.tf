resource "aws_iam_role" "ec2_role" {
  name = var.role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

}

resource "aws_iam_policy" "e2_policy" {
  name        = var.ec2_policy_name
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3: *",
        ]
        Effect = "Allow"
        Resource = [
          "${aws_s3_bucket.ziyotek_bucket.arn}",
          "${aws_s3_bucket.ziyotek_bucket.arn}/*",
        ]
      },
    ]
  })
}


resource "aws_iam_policy_attachment" "test-attach" {
  name       = var.ec2_policy_attachment_name
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.e2_policy.arn
}


//instance profile -- to access s3 for ec2 instance 
resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.ec2_role.name
}
