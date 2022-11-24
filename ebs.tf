resource "aws_ebs_volume" "ec2-ebs" {
  count             = var.ec2_count * var.ebs_volume_count
  availability_zone = "${element(aws_instance.ec2_server.*.availability_zone, floor (count.index/var.ebs_volume_count))}"
  size              = var.ec2_ebs_volume_size[count.index%var.ebs_volume_count]

  tags = {
    Name = "${var.product}-${var.environment}-ebs"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  count       = var.ec2_count * var.ebs_volume_count
  volume_id   = aws_ebs_volume.ec2-ebs.*.id[count.index]
  device_name = var.ec2_device_names[count.index%var.ebs_volume_count]
  instance_id = "${element(aws_instance.ec2_server.*.id, floor (count.index/var.ebs_volume_count))}"
}