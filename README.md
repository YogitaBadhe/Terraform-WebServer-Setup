Here’s a structured and detailed `README.md` file for project:

```markdown
# Launch and Configure Webserver using Terraform

This project provides a comprehensive guide for launching, connecting to, and configuring a webserver on AWS using Terraform. It includes steps to configure Terraform, manage AWS resources, and ensure a successful deployment.

---

## Prerequisites

Before starting, ensure the following are installed and configured:

- **Terraform**: Install and configure [Terraform](https://www.terraform.io/downloads.html).
- **AWS CLI**: Install and configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) using:
  ```bash
  aws configure
  ```
- **Git**: Install [Git](https://git-scm.com/).

---

## Steps

### 1. Launch EC2 Instance
Launch an EC2 instance through the AWS Management Console or use a predefined Terraform configuration to automate the process.

---

### 2. Connect to EC2 Instance
Use SSH to connect to the EC2 instance:
```bash
ssh -i "path-to-your-key.pem" ec2-user@your-ec2-instance-public-ip
```

---

### 3. Install Terraform and Dependencies
Ensure Terraform is installed on the EC2 instance. Also, set up AWS CLI:
```bash
# Install Terraform
sudo yum install -y terraform

# Configure AWS CLI
aws configure
```

---

### 4. Install Git
Install Git and configure it with your credentials:
```bash
sudo yum install git -y
git --version
git config --global user.name "your-username"
git config --global user.email "your-email@example.com"
```

---

### 5. Clone the Repository
Clone the project repository containing Terraform configurations:
```bash
git clone https://github.com/atulkamble/terraform-webserver-setup
cd terraform-webserver-setup
```

Alternatively, create project files manually using PowerShell:
```bash
mkdir terraformproject
cd terraformproject
New-Item main.tf
New-Item variables.tf
code .
```

---

### 6. Create Key Pair
Create an AWS key pair named `mywebserver.pem` via the AWS Management Console and save it in the `aws/aws_keys/` directory:
```bash
chmod 400 aws/aws_keys/mywebserver.pem
```

---

### 7. Update Terraform Configuration
Modify `main.tf` with the necessary details:
- AWS region
- AWS provider settings
- VPC ID, subnet ID, and AMI ID
- Key pair name

Update `variables.tf` to include the key pair name.

---

### 8. Initialize and Apply Terraform Configuration
Run the following Terraform commands to set up the infrastructure:
```bash
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply
```

---

### 9. Verify Deployment
After applying the Terraform configuration, retrieve the public IP address of the instance and verify the webserver is running by accessing it in a browser.

---

### 10. Clean Up
To destroy all resources created by Terraform, run:
```bash
terraform destroy
```

---

### 11. Commit and Push Code
Save your work to the GitHub repository:
```bash
git add .
git commit -m "Initial commit"
git push origin main
```

For private repositories, use your GitHub token:
```bash
git push https://<token>@github.com/<username>/terraform-webserver.git
```


## Acknowledgments
Special thanks to the Terraform and AWS documentation teams for their comprehensive guides.
```

This `README.md` provides a clear, structured guide for your project, making it user-friendly and professional.
