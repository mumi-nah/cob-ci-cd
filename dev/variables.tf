variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, prod)"
  type        = string
}

variable "managed_policy_arns" {
  description = "List of managed policy ARNs to attach to the IAM role"
  type        = list(string)
  default     = []
}