## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| stream\_name | Name that the stream will have, for example user\_events | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| api\_gateway\_kinesis\_put\_records\_role\_arn | ARN of a role that would allow API GW to put records on a kinesis stream and API GW to assume the role |

