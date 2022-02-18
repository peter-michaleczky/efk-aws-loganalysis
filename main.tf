terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

# TODO: confirm to IT that AWS access works
# TODO: compile yaml files to tf: use helm
