name: Terraform Deployment Workflow

on:
  push:
    branches:
      - main
    paths:
      - 'main.tf'
  schedule:
    - cron: '0 9 * * *'  # Runs daily at 09:00 UTC as a safety syncd

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    environment: production

    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: 1.5.0

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1

      - name: Initialize Terraform
        run: terraform init

      - name: Terraform Plan
        run: terraform plan

      - name: Apply Changes
        run: terraform apply -auto-approve

        #Testing the deploy file.
