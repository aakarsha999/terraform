#### RDS ####
resource "aws_db_subnet_group" "db-sub-grp" {
  name       = "db-sub-grp"
  subnet_ids = ["${aws_subnet.pvt-sub-3.id}","${aws_subnet.pvt-sub-4.id}"]
}

resource "aws_db_instance" "db" {
  allocated_storage           = 100
  storage_type                = "gp3"
  engine                      = "mysql"
  engine_version              = "8.0"
  instance_class              = "db.t2.micro"
  identifier                  = "db"
  username                    = "admin"
  password                    = "23vS5TdDW8*o"
  parameter_group_name        = "default.mysql8.0"
  db_subnet_group_name        = aws_db_subnet_group.db-sub-grp.name
  vpc_security_group_ids      = ["${aws_security_group.database-security-group.id}"]
  multi_az                    = true
  skip_final_snapshot         = true
  publicly_accessible          = false

  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}