## Requirements

| Name | Version |
|------|---------|
| aws | ~> 3.22.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cross\_account\_role\_arn | An ARN of an account that allows AWS account engineering to assume a role in AWS account data-platform | `string` | n/a | yes |
| eng-account-id | The AWS account id of the data origing, this can be retrieved from the AWS console under the support section | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| user\_events-stream\_name | n/a | `string` | `"user-events"` | no |
| user\_events\_data\_bucket\_name | n/a | `string` | `"user-events-data"` | no |
| user\_utm-stream\_name | n/a | `string` | `"user-utm"` | no |
| user\_utm\_data\_bucket\_name | n/a | `string` | `"user-utm-data"` | no |

## Outputs

| Name | Description |
|------|-------------|
| rest\_api-invoke\_url | n/a |

