variable "env" {
  type        = string
  description = "Deployment environment (e.g., dev, stg, prod)"
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "hash_key" {
  type = string
}