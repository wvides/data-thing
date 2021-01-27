## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | Name of the bucket where the stream data will be stored | `string` | n/a | yes |
| eng-account-id | Name of the origing account id, in this case the engineering account id, this value can be obtained under the support section of the AWS console | `string` | n/a | yes |
| log\_group\_name | n/a | `string` | n/a | yes |
| log\_stream\_name | n/a | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| stream\_name | Name of the stream, it is better to name this variable the same as the bucket | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cross\_account\_s3\_arn | ARN of the account that will be used to forward with kinesis firehose the data to a different account |

