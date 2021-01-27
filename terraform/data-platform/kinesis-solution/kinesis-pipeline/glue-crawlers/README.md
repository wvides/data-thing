## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| data\_bucket\_name | Name of the bucket that the s3\_crawler will crawl | `string` | n/a | yes |
| glue\_crawler\_arn | ARN of the IAM role that will be used to crawl the s3 bucket | `string` | n/a | yes |
| glue\_redshift\_connection\_name | The name of the glue redshift connection that will be used for the database crawler | `string` | `"redshift-dwh"` | no |
| redshift\_catalog\_databse\_name | Name for the catalog database that the glue crawler will use for to store the discovered redshift database schema | `string` | n/a | yes |
| redshift\_crawler\_name | Name for the redshift schema crawler | `string` | n/a | yes |
| redshift\_database | The name of the database in redshift where you want the data to be stored | `string` | n/a | yes |
| s3\_catalog\_database\_name | Name for the database that will be used by the s3 crawler | `string` | n/a | yes |
| s3\_crawler\_name | Name for the s3 bucket crawler | `string` | n/a | yes |
| schema | The schema name of the redshift database where the data will be stored | `string` | n/a | yes |
| table | The table name of the redshift database where the data will be stored | `string` | n/a | yes |

## Outputs

No output.

