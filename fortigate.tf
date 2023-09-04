resource "aws_network_interface" "public_intf" {
  subnet_id = aws_subnet.public.id

  tags = local.tags.fortigate_interfaces.public
}

resource "aws_eip" "public_ip" {
  network_interface = aws_network_interface.public_intf.id
}

resource "aws_network_interface" "private_intf" {
  subnet_id         = aws_subnet.private.id
  source_dest_check = false

  tags = local.tags.fortigate_interfaces.private
}

resource "aws_network_interface_sg_attachment" "public_intf_attachment" {
  depends_on           = [aws_network_interface.public_intf]
  security_group_id    = aws_security_group.security_groups["external"].id
  network_interface_id = aws_network_interface.public_intf.id
}

resource "aws_network_interface_sg_attachment" "private_intf_attachment" {
  depends_on           = [aws_network_interface.private_intf]
  security_group_id    = aws_security_group.security_groups["allow_all"].id
  network_interface_id = aws_network_interface.private_intf.id
}

resource "aws_instance" "fgt" {
  ami           = var.fgt_ami
  instance_type = var.size
  availability_zone = var.az
  user_data = templatefile("${var.bootstrap-fgt}", {
    type               = "${var.license_type}"
    license_file       = "${var.license}"
    adminsport         = "${var.adminsport}"
    fgt-hostname       = "${var.fgt-hostname}"
    fgt-admin-user     = "${var.fgt-admin-user}"
    fgt-admin-password = "${var.fgt-admin-password}"
    fgt-api-user       = "${var.fgt-api-user}"
    fgt-api-key        = "${var.fgt-api-key}"
    pub_key            = "${var.pub_key}"
  })

  root_block_device {
    volume_type = "standard"
    volume_size = "2"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "30"
    volume_type = "standard"
  }

  network_interface {
    network_interface_id = aws_network_interface.public_intf.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.private_intf.id
    device_index         = 1
  }

  tags = local.tags.fortigate
}
