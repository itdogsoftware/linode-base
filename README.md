# Linode Base Image

A custom Docker base image for Linode Kubernetes Engine (LKE) deployments.  
This image bundles the essential tools you need for automation and CI/CD:

- **kubectl** – Kubernetes CLI for cluster management
- **helm** – Package manager for Kubernetes applications
- **linode-cli** – Manage Linode resources via API
- **docker CLI** – Build and push container images

With this image, you don’t need to install these tools every time in your GitHub Actions or CI pipeline.

---

## 📦 Features
- Preinstalled `kubectl` (latest stable release)
- Preinstalled `helm` (Helm 3)
- Preinstalled `linode-cli` (Python-based CLI)
- Docker CLI (client only, for building/pushing images)
- Lightweight Ubuntu base

---

## 🚀 Usage

### Build locally
```bash
docker build -t linode-base:latest .
```

### Run interactively
```bash
docker run -it linode-base:latest bash
```

### In GitHub Actions
Use this image as your job runner to avoid installing tools each time:
```bash
jobs:
  deploy:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/<your-username>/linode-base:latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Deploy with Helm
        run: helm upgrade --install my-app ./charts/my-app --namespace default
```

### 🔑 Authentication
- Linode CLI:
Configure with your Personal Access Token (PAT):
```bash
linode-cli configure
```
- kubectl/helm:
Fetch kubeconfig from Linode API and mount it into the container:
```bash
curl -H "Authorization: Bearer $LINODE_PAT" \ https://api.linode.com/v4/lke/clusters/$CLUSTER_ID/kubeconfig \ --output kubeconfig.yaml export KUBECONFIG=$PWD/kubeconfig.yaml
```

### 🛠️ Example Workflow
- Build Docker image of your app.
- Push to a private registry (e.g., GHCR or Docker Hub).
- Use this base image in GitHub Actions.
- Run helm upgrade to deploy to Linode Kubernetes.

### 📄 License
MIT License – free to use and adapt.

---
👉 This version is ready to drop straight into your repo as `README.md`. It preserves the Markdown markup so GitHub will render it nicely.  

Would you like me to also add a **section on using GitHub Container Registry (GHCR) for private images**, since you mentioned needing a private registry earlier?
