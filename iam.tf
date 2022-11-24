
resource "aws_iam_role" "ec2_role" {
  name = "${var.product}.${var.environment}.ec2-role"

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

  resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.product}.${var.environment}.ec2-profile"
  role = aws_iam_role.ec2_role.name
}