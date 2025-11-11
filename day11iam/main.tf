#########################################
# 1️⃣ Create IAM Role for EC2
#########################################

resource "aws_iam_role" "ec2_role" {
  name = "ec2-fullaccess-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

#########################################
# 2️⃣ Attach EC2 Full Access Policy
#########################################

resource "aws_iam_role_policy_attachment" "ec2_full_access" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

#########################################
# 3️⃣ Create Instance Profile (needed to attach role)
#########################################

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-fullaccess-profile"
  role = aws_iam_role.ec2_role.name
}

#########################################
# 4️⃣ Launch EC2 Instance with IAM Role
#########################################

resource "aws_instance" "prashanth" {
  ami           = "ami-0cae6d6fe6048ca2c" # Amazon Linux 2 AMI (Mumbai)
  instance_type = "t3.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "prashanth"
  }
}


#created iam role with ec2 full access and attched to the ec2