resource "aws_instance" "this" {
  count = var.instance_count
  ami = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "${var.instance_name}-${count.index + 1}"
  }

  security_groups = [var.security_group_name]

  depends_on = [var.depends_on_sg]
}
