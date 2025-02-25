data "aws_ami" "example" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20230612.0-x86_64-gp2"]
  }
}


# data "aws_s3_bucket" "selected" {
#   bucket = "tsering-namgyal-2024"
# }
# data "aws_security_group" "selected" {
#   #id = "sg-0658e2b76581050a2"
#   name = "delete-me-sg"
# }


# output "bucket_name" {
#   value = data.aws_s3_bucket.selected.arn

# }
output "show_me_the_ami" {
  value = data.aws_ami.example.image_id

}
  