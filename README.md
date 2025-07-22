# 🚀 DevOps Automation: Deploy App Using Apache on EC2 with Terraform

## ✅ Step-by-Step Instructions

### 1. **Initialize Terraform**

Run this inside your `terraform/` directory:

```bash
terraform init
```

This initializes the working directory and downloads necessary Terraform providers.

---

### 2. **Preview Infrastructure Plan**

```bash
terraform plan
```

This shows what resources Terraform will create or modify.

---

### 3. **Provision Infrastructure**

```bash
terraform apply -auto-approve
```

This will:

* Launch an EC2 instance
* Provision Apache using `user_data.sh`
* Serve a default or custom HTML web page

---

### 4. **Get EC2 Public IP**

After `terraform apply`, note the **public IP** from the output or AWS EC2 console.
Example:

```
Public IP: 44.247.104.156
```

---

### 5. **SSH Into EC2 Instance**

Use your private key to SSH into the server:

```bash
ssh -i ~/.ssh/app-server.pem ubuntu@<public-ip>
```

Make sure the key name matches the one used during EC2 creation.

---

### 6. **Verify Apache Installation**

Run the following inside the EC2 terminal:

```bash
sudo systemctl status apache2
```

You should see output showing Apache is **active (running)**.

---

### 7. **Access the Web Page**

Open your browser and visit:

```
http://<public-ip>/
```

You should see the default or custom web page deployed by your `user_data.sh` script.
