# terraform-aws-ec2-module

module "ec2-dev" {
    source = "../../terraform-aws-ec2-module"
    ami = "ami-04706e771f950937f"
    instance_type = "t2.micro"
    product = "tesla"
    environment = "dev"
    key_name = "myaws"
    vpc_id = "vpc-003aa9bde553f8665"
    #az = "eu-west-2a"
    #size = 2
    #device_name = "/dev/xvdb"
    #subnet = "subnet-068149b088bb5371a"
    ec2_count = 3
    ebs_volume_count        = 2
    ec2_ebs_volume_size     = [2, 5]
    ec2_device_names        = ["/dev/sdd", "/dev/sde"]
    subnet_ids              = ["subnet-068149b088bb5371a", "subnet-027e1312d76fed1a1", "subnet-0ce6f355fce16536e"]
    availability_zones      = ["eu-west-2a","eu-west-2b", "eu-west-2c"]

}

createwebsite.sh

#!/bin/bash
yum update -y
yum install httpd -y
cd /var/www/html
echo "<h1>Deployed via Terraform</h1>" > index.html
curl -s http://169.254.169.254/latest/dynamic/instance-identity/document > details.html
service httpd start
chkconfig httpd on
