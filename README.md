# IIM-GCP | Nicolas Brazzolotto

## Description

This action uses `gsutil` to create Cloud Storage Bucket for terraform backend state files. After creating bucket, it runs following terraform commands

- terraform fmt -check
- terraform init
- terraform validate

## Inputs

| parameter | description | required | default |
| - | - | - | - |
| project-id | GCP Project Id | `true` |  |
| tf-backend-bucket-name | Cloud storage bucket name for terraform state file | `true` |  |
| prefix | Prefix for tfstate file in storage bucket for terraform backend | `true` |  |
| terraform-version | Terraform version | `false` | latest |
| working-directory | Location of terraform scripts | `false` | . |

## Runs

This action is a `composite` action.
