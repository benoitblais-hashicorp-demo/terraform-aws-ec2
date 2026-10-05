################################################################################
# Required Variables
################################################################################

variable "name" {
  description = "(Required) Name to be used on EC2 instance created."
  type        = string
}

variable "instance_type" {
  description = "(Required) The type of instance to start (e.g. t3.micro, t3.small, m5.large)."
  type        = string
}

variable "subnet_id" {
  description = "(Required) The VPC Subnet ID to launch the instance in."
  type        = string
}

################################################################################
# Optional Variables
################################################################################

variable "ami" {
  description = "(Optional) ID of AMI to use for the instance. If not provided, the latest Amazon Linux 2023 AMI (AL2023) will be used automatically."
  type        = string
  default     = null
}

variable "associate_public_ip_address" {
  description = "(Optional) Whether to associate a public IP address with an instance in a VPC."
  type        = bool
  default     = null
}

variable "availability_zone" {
  description = "(Optional) AZ to start the instance in."
  type        = string
  default     = null
}

variable "aws_region" {
  description = "(Optional) The AWS region to deploy the EC2 instance into."
  type        = string
  default     = "ca-central-1"
}

variable "cpu_credits" {
  description = "(Optional) The credit option for CPU usage (unlimited or standard)."
  type        = string
  default     = null
}

variable "create" {
  description = "(Optional) Whether to create an instance."
  type        = bool
  default     = true
}

variable "create_os_credentials_secret" {
  description = "(Optional) Explicitly controls whether to store OS credentials in AWS Secrets Manager. Note: If credentials are not provided in `os_credentials`, secrets are automatically generated and stored in Secrets Manager."
  type        = bool
  default     = false
}

variable "disable_api_termination" {
  description = "(Optional) If true, enables EC2 Instance Termination Protection."
  type        = bool
  default     = null
}

variable "ebs_block_device" {
  description = "(Optional) Additional EBS block devices to attach to the instance."
  type        = list(any)
  default     = []
}

variable "ebs_optimized" {
  description = "(Optional) If true, the launched EC2 instance will be EBS-optimized."
  type        = bool
  default     = null
}

variable "enable_volume_tags" {
  description = "(Optional) Whether to enable volume tags (if enabled it conflicts with root_block_device tags)."
  type        = bool
  default     = true
}

variable "iam_instance_profile" {
  description = "(Optional) IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
  type        = string
  default     = null
}

variable "instance_initiated_shutdown_behavior" {
  description = "(Optional) Shutdown behavior for the instance. Available values: stop, terminate."
  type        = string
  default     = null
}

variable "instance_tags" {
  description = "(Optional) Additional tags for the instance."
  type        = map(string)
  default     = {}
}

variable "key_name" {
  description = "(Optional) Key name of the Key Pair to use for the instance."
  type        = string
  default     = null
}

variable "metadata_options" {
  description = "(Optional) Customize the metadata options of the instance."
  type        = map(string)
  default = {
    "http_endpoint"               = "enabled"
    "http_put_response_hop_limit" = 1
    "http_tokens"                 = "optional"
  }
}

variable "monitoring" {
  description = "(Optional) If true, the launched EC2 instance will have detailed monitoring enabled."
  type        = bool
  default     = null
}

variable "os_credentials" {
  description = "(Optional) Map of user names to explicit passwords. If omitted or if a username is mapped to null, a random password will be automatically generated and stored in AWS Secrets Manager."
  type        = map(string)
  default     = {}
}

variable "private_ip" {
  description = "(Optional) Private IP address to associate with the instance in a VPC."
  type        = string
  default     = null
}

variable "putin_khuylo" {
  description = "(Optional) Do you agree that Putin doesn't respect Ukrainian sovereignty and territorial integrity? More info: https://en.wikipedia.org/wiki/Putin_khuylo!"
  type        = bool
  default     = true
}

variable "root_block_device" {
  description = "(Optional) Customize details about the root block device of the instance."
  type        = list(any)
  default     = []
}

variable "secret_description" {
  description = "(Optional) Description for the Secrets Manager secret storing OS credentials."
  type        = string
  default     = "Linux VM credentials managed by Terraform"
}

variable "secret_name" {
  description = "(Optional) Name for the Secrets Manager secret storing OS credentials. Defaults to `demo/linux/<name>`."
  type        = string
  default     = null
}

variable "secret_recovery_window_in_days" {
  description = "(Optional) Number of days that AWS Secrets Manager waits before deleting a secret (0 for immediate deletion)."
  type        = number
  default     = 0
}

variable "secret_tags" {
  description = "(Optional) A map of tags to assign to the Secrets Manager secret."
  type        = map(string)
  default     = {}
}

variable "source_dest_check" {
  description = "(Optional) Controls if traffic is routed to the instance when the destination address does not match the instance."
  type        = bool
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "tenancy" {
  description = "(Optional) The tenancy of the instance. Available values: default, dedicated, host."
  type        = string
  default     = null
}

variable "timeouts" {
  description = "(Optional) Define maximum timeout for creating, updating, and deleting EC2 instance resources."
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "(Optional) The user data to provide when launching the instance."
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "(Optional) Base64-encoded binary data to pass as user data."
  type        = string
  default     = null
}

variable "user_data_replace_on_change" {
  description = "(Optional) Triggers a destroy and recreate when user_data changes."
  type        = bool
  default     = null
}

variable "volume_tags" {
  description = "(Optional) A mapping of tags to assign to the devices created by the instance at launch time."
  type        = map(string)
  default     = {}
}

variable "vpc_security_group_ids" {
  description = "(Optional) A list of security group IDs to associate with."
  type        = list(string)
  default     = null
}
