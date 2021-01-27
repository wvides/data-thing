## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws.data-platform | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cross\_account\_role\_arn | An ARN of an account that allows AWS account engineering to assume a role in AWS account data-platform | `string` | n/a | yes |
| data\_bucket\_name | The name of the bucket where the data will be stored | `string` | n/a | yes |
| data\_origin\_account\_id | The AWS account id of the data origing, this can be retrieved from the AWS console under the support section | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| stream\_name | n/a | `string` | n/a | yes |

## Outputs

No output.

