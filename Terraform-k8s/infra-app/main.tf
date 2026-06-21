# 1. Security Group for K8s Nodes
resource "aws_security_group" "k8s_sg" {
  name        = "${var.env}-k8s-security-group"
  description = "Security group for Kubernetes nodes"

  # SSH Access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # In production, restrict this to your IP
  }

  # Kubernetes API Server (Control Plane)
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Kubelet API
  ingress {
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # NodePort Services (Your Flask App will expose here if using NodePort)
  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Flask App Port (Direct container access if needed)
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rules: Allow everything
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.env}-k8s-sg"
    Environment = var.env
  }
}

# 2. EC2 Instances linked to the Security Group
resource "aws_instance" "k8s_nodes" {
  count                  = var.instance_count
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.k8s_sg.id] # Links the SG here

  tags = {
    Name        = "${var.env}-k8s-node-${count.index + 1}"
    Environment = var.env
  }
}