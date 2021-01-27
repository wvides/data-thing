## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| api\_gateway-name | Name that will be assigned to the API GW | `string` | n/a | yes |
| put\_records\_role\_arn | A ARN of a role that allows API GW to put records in a Kinesis stream and api gateway to assume the role | `string` | n/a | yes |
| region | Region where the API Gateway will be spawned | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| rest\_api-invoke\_url | The URL at which the API GW that serves as kinesis streams reverse proxy can be invoked |

