# Cloud Run Infrastructure with Terraform

## Overview

## Features

## Prerequisites

## Step By Step

- Create two GitHub repositories, one for "infra" and the other for "app".
- Add GitHub App "Google Cloud Build" to my GitHub repositories.
- Create GitHub Personal access token and it will be saved in Google Cloud Secret.
- Create Terraform modules to provision, manage, and automate resources in GCP.
- Create a bucket for Terraform backend.
- Save GitHub access token, db user, db password in Google Cloud Secret Manger.
- 

- Modules
    1. enable APIs.
    2. create gcp bucket.
    3. IAM bindings for a bucket: assign roles to users or service accounts.
    4. secret manager to store secret.
    5. secret access to a service account.
    6. create a service account and assign roles.
    7. IAM bindings for a service account.
    8. workload identity:
        - create a WI pool
        - create a WI provider for a GitHub repo.
        - bind the WI pool, a service account, a  GitHub repo.
    9. cloud build connection to GitHub: use GitHub App Id, GitHub Access Token.
    10. cloud build repository link: use connection name, GitHub repo uri.
    11. cloud build trigger: create manually (can not use terraform now) using connection and repository link.
    12. cicd pipeline wrapper
        - crate a service account and assign roles
        - create a log bucket, grant the sa access to this bucket
        - create a workload identity for this sa
        - allow the sa to access GitHub Secret token
        - github connection
        - github link
        - cloud build trigger
    13. VPC
    14. Subnet
    15. Firewall
    16. Artifact Repository
    17. Cloud SQL Postgres
    18. Cloud SQL MySQL
1. Create a GCS bucket for Tearraform backend
    - enable APIs
    - create a bucket with a unique bucket name
2. Store secrets
    - setup terraform backend with the created bucket
    - enable APIs
    - store secrets (GitHub token, db_user, db_password)
    - grant the default cloud build service account access to the secrets

