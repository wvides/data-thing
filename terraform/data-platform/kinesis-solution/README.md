## Requirements

| Name | Version |
|------|---------|
| aws | ~> 3.22.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.22.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zone | The AZ (Availability zone where the subnet (subnet\_id) you picked exists | `string` | n/a | yes |
| cluster\_identifier | The identifier of your cluster | `string` | n/a | yes |
| cross\_account\_role\_arn | An ARN of an account that allows AWS account engineering to assume a role in AWS account data-platform | `string` | n/a | yes |
| data\_origin\_account\_id | The AWS account id of the data origing, this can be retrieved from the AWS console under the support section | `string` | n/a | yes |
| redshift\_connection\_name | n/a | `string` | `"redshift-dwh"` | no |
| redshift\_database | The name of the database in redshift where you want the data to be stored | `string` | n/a | yes |
| redshift\_password | n/a | `string` | n/a | yes |
| redshift\_port | The port on which you want to connect to your redshift database | `string` | n/a | yes |
| redshift\_user | n/a | `string` | n/a | yes |
| region | n/a | `string` | `"eu-central-1"` | no |
| route\_table\_ids | n/a | `list(any)` | n/a | yes |
| security\_group\_id\_list | A security group id list, could be one or more | `list(any)` | n/a | yes |
| subnet\_id | The id of one the subnets in your vpc, this should match the vpc defined on vpc\_id and should be the same vpc where your redshift cluster is | `string` | n/a | yes |
| user\_events\_data\_bucket\_name | n/a | `string` | `"user-events-data"` | no |
| user\_utm\_data\_bucket\_name | n/a | `string` | `"user-utm-data"` | no |
| vpc\_id | The vpc-id for the data-platform account, use here the VPC where the Redshift cluster exists/will be created | `string` | n/a | yes |

## Outputs

No output.

