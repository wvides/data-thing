## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zone | The AZ (Availability zone where the subnet (subnet\_id) you picked exists | `string` | n/a | yes |
| cluster\_identifier | The identifier of your cluster | `string` | n/a | yes |
| glue\_redshift\_connection\_name | The name that you want this glue-redshift connection to have | `string` | `"redshift-dwh"` | no |
| redshift\_database | The name of the database in redshift where you want the data to be stored | `string` | n/a | yes |
| redshift\_password | n/a | `string` | n/a | yes |
| redshift\_port | The port that will be used to connect to the database | `string` | n/a | yes |
| redshift\_user | n/a | `string` | n/a | yes |
| security\_group\_id\_list | A security group id list, could be one or more | `list(any)` | n/a | yes |
| subnet\_id | The id of one the subnets in your vpc, this should match the vpc defined on vpc\_id and should be the same vpc where your redshift cluster is | `string` | n/a | yes |

## Outputs

No output.

