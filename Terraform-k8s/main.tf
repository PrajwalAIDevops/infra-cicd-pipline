module "dev-env" {
  source         = "./infra-app"
  env            = "stg"
  ami            = "ami-0b6d9d3d33ba97d99"
  instance_type  = "t3.micro"
  instance_count = 2
  hash_key       = "dev-infra-app"
}