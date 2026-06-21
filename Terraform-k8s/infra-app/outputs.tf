output "k8s_instances" {
  description = "Exposes the raw EC2 instance resources to the root directory"
  # This must match whatever you named your resource inside infra-app/main.tf
  value       = aws_instance.k8s_nodes 
}