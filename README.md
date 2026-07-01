# AWS Static Website with Terraform

A Terraform blueprint to deploy a static website on AWS using an S3 bucket and CloudFront CDN.

## Project Structure
* **provider.tf** - AWS provider settings
* **s3.tf** - S3 bucket configuration
* **cloudfront.tf** - CloudFront configuration
* **index.html** - Website file ("Hello World")
* **README.md** - Project documentation

## Deployment Steps

Run these commands in your VS Code terminal:

1. Initialize the project:
   ```bash
   terraform init
   ```

2. Preview the resources:
   ```bash
   terraform plan
   ```

3. Deploy to AWS:
   ```bash
   terraform apply
   ```

## Clean Up

To delete all infrastructure and stop AWS charges:
```bash
terraform destroy
```
