terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.37.0"
    }
  }

  backend "remote" {
    organization = "sw-418"

    workspaces {
      name = "sw-418-dynamo"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "production-users"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}
