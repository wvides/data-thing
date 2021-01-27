## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_role\_arn | The arn value of a role that allows a kinesis firehose to put objects in the destination bucket | `string` | n/a | yes |
| bucket\_destiny\_name | Name of the destination bucket for the objects published by firehose | `string` | n/a | yes |
| log\_group\_name | n/a | `string` | n/a | yes |
| log\_stream\_name | n/a | `string` | n/a | yes |
| retention\_period | The retention period in hours of the data published to the kinesis stream | `number` | n/a | yes |
| shard\_count | Number of shards for the stream | `number` | n/a | yes |
| stream\_name | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| stream\_user\_event-arn | n/a |
| stream\_user\_event-retention\_period | n/a |
| stream\_user\_event-shard\_count | n/a |

