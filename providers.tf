terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Ajusta según la última versión compatible
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Cambia según tu región preferida
}