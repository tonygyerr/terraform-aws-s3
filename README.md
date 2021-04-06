## Module S3
```hcl
module "s3" {
  source        = "git::ssh://git@github.com:tonygyerr/terraform-aws-s3.git"
  sse_algorithm = "${var.sse_algorithm}"
  bucket_name   = "${var.bucket_name}"
  account_id  = "${var.account_id}"
  application = "${var.application}"
  environment = "${var.environment}"
  region      = "${var.aws_region}"
  tags = var.tags
}
```
## Prerequisites
- Docker (for using Docker Image of dependencies)
- Git
- Terraform
- AWS Key pair for Terraform provisioning.
- AWS S3 bucket for remote terraform state file (tfstate)
- AWS Dynamo Database for tfstate table state lock 

## How to run this Module using Terraform Commands
```bash
cd examples
terraform get
terraform init -backend-config ../backend-config/dev.tfvars
terraform plan -var-file="../env-config/dev.tfvars"
terraform apply -var-file="../env-config/dev.tfvars" -auto-approve
terraform destroy -var-file="../env-config/dev.tfvars"
```
## How to Run this Module using Please Build Process
```bash
plz run //:plan_exe dev us-east-1
plz run //:apply_exe dev us-east-1
plz run //:destroy_exe dev us-east-1
```

## Requirements

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| Bastion | n/a | `string` | `""` | no |
| Cert1 | n/a | `string` | `""` | no |
| Cert2 | n/a | `string` | `""` | no |
| CustName | n/a | `string` | `""` | no |
| account\_id | n/a | `string` | n/a | yes |
| application | n/a | `string` | n/a | yes |
| aws\_region | Default AWS Region | `string` | `"us-east-2"` | no |
| az\_2a | az 2a | `string` | `"us-east-2a"` | no |
| az\_2b | az 2b | `string` | `"us-east-2b"` | no |
| bucket\_name | development name of the bucket that will use as origin for CDN | `any` | n/a | yes |
| dev\_api\_key\_name | n/a | `string` | `"devApiKey"` | no |
| dev\_api\_key\_type | n/a | `string` | `"API_KEY"` | no |
| dev\_db\_prv\_subnet\_2b | dev private database subnet 2b for the vpc | `string` | `"172.16.5.0/24"` | no |
| dev\_prv\_subnet\_1 | dev private subnet 1 for the vpc | `string` | `"172.16.1.0/24"` | no |
| dev\_prv\_subnet\_2 | dev private subnet 2  for the vpc | `string` | `"172.16.3.0/24"` | no |
| dev\_pub\_subnet\_1 | dev public subnet 1 for the vpc | `string` | `"172.16.0.0/24"` | no |
| dev\_pub\_subnet\_2 | dev public subnet 2 for the vpc | `string` | `"172.16.2.0/24"` | no |
| dev\_quota\_limit | n/a | `number` | `2000` | no |
| dev\_quota\_offset | n/a | `number` | `0` | no |
| dev\_quota\_period | n/a | `string` | `"DAY"` | no |
| dev\_throttle\_burst\_limit | n/a | `number` | `30` | no |
| dev\_throttle\_rate\_limit | n/a | `number` | `60` | no |
| dev\_usage\_plan\_description | n/a | `string` | `"The default dev usage plan"` | no |
| dev\_usage\_plan\_name | n/a | `string` | `"dev Usage Plan"` | no |
| dev\_vpc\_cidr | Development VPC CIDR Range | `string` | `"172.16.0.0/16"` | no |
| domain | n/a | `string` | `"*.my-domain-name.com"` | no |
| domain\_name | Name of the domain where record(s) need to create | `string` | `"*.my-domain-name.com"` | no |
| environment | n/a | `string` | `"development"` | no |
| gateway\_description | n/a | `string` | `""` | no |
| gateway\_name | n/a | `string` | `""` | no |
| jenkins\_credentials\_id | Jenkins credentials | `string` | `""` | no |
| jenkins\_master\_instance\_type | Jenkins Master instance type | `string` | `"t2.large"` | no |
| jenkins\_password | Jenkins password | `string` | `""` | no |
| jenkins\_slave\_instance\_type | Jenkins Slave instance type | `string` | `"t2.micro"` | no |
| jenkins\_username | Jenkins username | `string` | `""` | no |
| key\_name | n/a | `string` | `""` | no |
| max\_jenkins\_slaves | Max slaves | `string` | `"5"` | no |
| min\_jenkins\_slaves | Min slaves | `string` | `"3"` | no |
| nexus\_instance\_type | Nexus instance type | `string` | `"t2.xlarge"` | no |
| oai\_principal\_arn | n/a | `string` | `""` | no |
| owner | n/a | `string` | `""` | no |
| parameter\_group\_name | n/a | `string` | `"default.redis2.8"` | no |
| price\_class | Price classes provide you an option to lower the prices you pay to deliver content out of Amazon CloudFront | `string` | `"PriceClass_100"` | no |
| region | n/a | `string` | n/a | yes |
| retain\_on\_delete | Instruct CloudFront to simply disable the distribution instead of delete | `bool` | `false` | no |
| retention\_period | n/a | `string` | `"48"` | no |
| s3\_bucket\_cloudtrail\_log\_id | n/a | `string` | `""` | no |
| shard\_count | n/a | `string` | `"1"` | no |
| sse\_algorithm | n/a | `string` | n/a | yes |
| subject\_alternative\_names | Subject alternative domain names | `list` | `[]` | no |
| tags | optional tags | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| s3\_bucket\_id | n/a |
