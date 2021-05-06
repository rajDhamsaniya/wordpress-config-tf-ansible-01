resource "aws_key_pair" "login_key" {
  key_name   = "login-key"
  public_key = file(abspath("/home/rdhamsaniya/.ssh/id_rsa.pub"))
}
