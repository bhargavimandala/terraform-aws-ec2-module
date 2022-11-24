resource "aws_instance" "ec2_server" {
  
  count =  var.ec2_count
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.id
  availability_zone = var.availability_zones[count.index]
  subnet_id               = var.subnet_ids[count.index]
  user_data = "${file("createwebsite.sh")}"

   ###root_block_device {
    ###delete_on_termination = var.ec2_delete_root_volume_on_termination
    ##volume_size = var.ec2_rootvol_size
    ##volume_type           = var.volume_type
    ##encrypted             = var.encrypted
  ##}

  tags = {
    Name = "${var.product}-${var.environment}-ec2${count.index}"
    terraformrepo = "${var.terraform_repo}"
  }
}

