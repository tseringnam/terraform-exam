# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   db_name              = "ziyo_db"
#   engine               = "postgres"
#   engine_version       = "12.15"
#   instance_class       = "db.t3.micro"
#   username             = "ziyo_user"
#   password             = aws_ssm_parameter.foo.value
#   parameter_group_name = "default.postgres12"
#   skip_final_snapshot  = true
#   #final_snapshot_identifier = "terraform-20240516041642005800000001-snapshot"
#   db_subnet_group_name = aws_db_subnet_group.ziyo_subg.id
#   vpc_security_group_ids = [aws_security_group.allow_tls.id]
#   storage_type = "gp2"
#   #kms_key_id = aws_kms_key.ssm_key.key_id
# }

# resource "aws_db_subnet_group" "ziyo_subg" {
#   name       = "ziyo_sub_group"
#   subnet_ids = [aws_subnet.ziyo_subnet_public.id, aws_subnet.ziyo_subnet_private.id]
#   tags = {
#     Name = "My DB subnet group"
#   }
# }

# resource "aws_kms_key" "ssm_key" {
#   description             = "KMS key for ssm params"
#   deletion_window_in_days = 10
# }


# resource "random_password" "password" {
#   length           = 10
#   special          = false
#   #override_special = "!#$%&*()-_=+[]{}<>:?"
# }

# resource "aws_ssm_parameter" "foo" {
#   name  = "ziyo_class_rds_pass"
#   type  = "SecureString"
#   value = random_password.password.result
# }
