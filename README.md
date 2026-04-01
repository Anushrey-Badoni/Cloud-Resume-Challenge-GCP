# 🌐 Cloud Portfolio Website with Visitor Counter

Welcome to my personal cloud-powered portfolio website hosted on **Google Cloud Platform (GCP)** — complete with **Terraform-managed infrastructure**, a **Cloud Function visitor counter**, **HTTPS**, and **CI/CD** via **GitHub Actions**.

🔗 Live Site: [https://anushrey.dev](https://anushrey.dev)(Not Live)

---

## 🚀 Features

- 🌍 A static website hosted on **Google Cloud Storage**
- 🔒 Secured with **HTTPS** via a **Global Load Balancer**
- 🔢 A **serverless visitor counter** using **Cloud Functions (2nd Gen)** and **Firestore**
- ⚙️ Infrastructure fully managed with **Terraform**
- 🤖 Automatic deployment through **GitHub Actions**
- 🧩 Custom domain setup with **Cloud DNS**

---

## 🛠️ Tech Stack

| Layer         | Technology                                  |
|---------------|---------------------------------------------|
| Cloud         | Google Cloud Platform (GCP)                 |
| Infra         | Terraform                                   |
| CI/CD         | GitHub Actions                              |
| Storage       | GCS (Google Cloud Storage)                  |
| Backend       | Cloud Functions (Python) + Firestore        |
| Domain/DNS    | Google Cloud DNS + HTTPS                    |
| Frontend      | HTML, CSS, JS (vanilla)                     |

---

## 📂 Project Structure

/
├── .github/
│   └── workflows/
│       └── deploy.yml                 # GitHub Actions CI/CD workflow
│
├── frontend/                          # Static website
│   ├── index.html
│   ├── script.js
│   └── style.css
│
├── terraform/                         # Infrastructure as Code (Terraform)
│   ├── .terraform/                    # Terraform internal config (auto-generated)
│   ├── cloud_function/
│   │   ├── main.py                    # Cloud Function code
│   │   ├── requirements.txt
│   │   └── function-source.zip
│   │
│   ├── cloud_function.tf             # Cloud Function resources
│   ├── dns.tf                        # DNS setup
│   ├── frontend.tf                   # GCS static site resources
│   ├── loadbalancer.tf              # HTTPS Load Balancer
│   ├── main.tf                      # Root module
│   ├── outputs.tf                   # Terraform outputs
│   ├── variables.tf                 # Input variables
│   ├── terraform.tfvars             # Variable values
│   ├── terraform.tfstate            # Terraform state (don't push to GitHub)
│   ├── terraform.tfstate.backup     # State backup
│   └── sa-key.json                  # GCP Service Account key (✅ should be in .gitignore!)
│
├── .gitignore
├── README.md


