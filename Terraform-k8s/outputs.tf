output "master_public_ip" {
  description = "Public IP of the Kubernetes Master Node"
  # Grabs the first EC2 instance (Index 0) from the module's output
  value       = module.dev-env.k8s_instances[0].public_ip
}

output "worker_public_ips" {
  description = "Public IPs of the Kubernetes Worker Nodes"
  # Slices the remaining instances based on your root variable count
  value       = slice(module.dev-env.k8s_instances[*].public_ip, 1, var.instance_count)
}