# Host a Secure Static Website on AWS using Terraform 🚀

This repository contains production-ready Infrastructure as Code (IaC) to deploy a highly available, secure, and globally distributed static website on AWS. It automates the provisioning of an isolated storage layer, content delivery network, and secure access policies.

## 🏗️ Architecture Overview

The infrastructure is designed around AWS best practices for security and performance:
* **Storage:** Amazon S3 bucket configured for static website hosting with public access explicitly blocked at the bucket level.
* **Content Delivery:** Amazon CloudFront serving as the global Content Delivery Network (CDN) to cache assets at edge locations.
* **Security:** CloudFront Origin Access Control (OAC) to securely restrict S3 bucket access solely to the CloudFront distribution.

---

## 📁 Repository Structure

```text
aws-static-website-terraform/
├── README.md          # Project documentation and deployment guide
├── provider.tf        # AWS provider and Terraform version constraints
├── s3.tf              # S3 bucket configuration and hosting policies
├── cloudfront.tf      # CloudFront distribution and OAC setup
└── index.html         # Sample website landing page
```

---

## 🛠️ Prerequisites

Before deploying, ensure you have the following tools installed and configured:
* [Terraform](https://hashicorp.com) (v1.5.0+)
* [AWS CLI](https://amazon.com) configured with appropriate IAM administrative permissions
* An active AWS Account

---

## 🚀 Deployment Steps

### 1. Initialize Terraform
Open your terminal in VS Code within your project directory and initialize the working directory to download the required AWS providers.
```bash
terraform init
```

### 2. Review the Execution Plan
Generate and review the speculative execution plan to verify the resources that will be created.
```bash
terraform plan
```

### 3. Apply the Configuration
Deploy the infrastructure to your AWS account. Confirm the prompt by typing `yes`.
```bash
terraform apply
```

---

## 🗑️ Clean Up

To avoid ongoing AWS charges, destroy all provisioned infrastructure components when you are finished:
```bash
terraform destroy
```

---

## 🔒 Security & Best Practices Implemented
* **Principle of Least Privilege:** S3 bucket policies utilize explicit IAM conditions allowing only your unique CloudFront distribution ARN to fetch objects.
* **Encryption in Transit:** CloudFront is configured to viewer-protocol-policy `redirect-to-https` to enforce SSL/TLS encryption.
