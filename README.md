# Infrastructure as Code with Azure Bicep

![Architecture](architecture.png)

---

## Overview

Most engineers build cloud infrastructure by clicking through the Azure portal. This project does it differently.

Every resource — the Virtual Network, the subnets, the App Service Plan, and the Web App — is defined as code in `.bicep` files and deployed with a single terminal command. Delete the entire environment and run the same command again. You get the exact same infrastructure back in under 5 minutes.

That is Infrastructure as Code.

---

## What Was Built

A modular 3-tier Azure architecture deployed entirely through Bicep:

- **Virtual Network** with two subnets — one for application tier, one for database tier
- **App Service Plan** — Free tier hosting plan
- **Web Application** — Live Azure App Service with a public URL

**Live URL:** https://app-p08-rkgzkmw4e3sqi.azurewebsites.net

---

## Tech Stack

| Layer | Technology |
|---|---|
| IaC Tool | Azure Bicep |
| Networking | Azure Virtual Network (10.0.0.0/16) |
| Compute | Azure App Service — Free Tier (F1) |
| CLI | Azure CLI 2.86 |
| Source Control | GitHub |
| Region | Norway East |

---

## What Bicep Does in This Project

| Concept | What it does |
|---|---|
| **param** | Accepts variables at deploy time — location, app name, credentials |
| **resource** | Declares one Azure resource to create |
| **module** | Calls a separate .bicep file — keeps each resource isolated and reusable |
| **uniqueString()** | Generates a unique suffix so resource names never conflict across deployments |
| **output** | Prints important values after deployment — App URL, VNet name — without manual searching |
| **@secure()** | Marks sensitive parameters so they are never logged or exposed |$readme = @'
# Infrastructure as Code with Azure Bicep

![Architecture](architecture.png)

---

## Overview

Most engineers build cloud infrastructure by clicking through the Azure portal. This project does it differently.

Every resource — the Virtual Network, the subnets, the App Service Plan, and the Web App — is defined as code in `.bicep` files and deployed with a single terminal command. Delete the entire environment and run the same command again. You get the exact same infrastructure back in under 5 minutes.

That is Infrastructure as Code.

---

## What Was Built

A modular 3-tier Azure architecture deployed entirely through Bicep:

- **Virtual Network** with two subnets — one for application tier, one for database tier
- **App Service Plan** — Free tier hosting plan
- **Web Application** — Live Azure App Service with a public URL

**Live URL:** https://app-p08-rkgzkmw4e3sqi.azurewebsites.net

---

## Tech Stack

| Layer | Technology |
|---|---|
| IaC Tool | Azure Bicep |
| Networking | Azure Virtual Network (10.0.0.0/16) |
| Compute | Azure App Service — Free Tier (F1) |
| CLI | Azure CLI 2.86 |
| Source Control | GitHub |
| Region | Norway East |

---

## What Bicep Does in This Project

| Concept | What it does |
|---|---|
| **param** | Accepts variables at deploy time — location, app name, credentials |
| **resource** | Declares one Azure resource to create |
| **module** | Calls a separate .bicep file — keeps each resource isolated and reusable |
| **uniqueString()** | Generates a unique suffix so resource names never conflict across deployments |
| **output** | Prints important values after deployment — App URL, VNet name — without manual searching |
| **@secure()** | Marks sensitive parameters so they are never logged or exposed |

---

## Project Structure---

## How to Deploy

**Prerequisites:** Azure CLI installed, active Azure subscription

```bash
# Step 1 — Create resource group
az group create \
  --name rg-bicep-3tier \
  --location norwayeast

# Step 2 — Deploy everything with one command
az deployment group create \
  --resource-group rg-bicep-3tier \
  --template-file main.bicep \
  --parameters parameters.json

# Step 3 — View outputs (App URL, VNet name)
az deployment group show \
  --resource-group rg-bicep-3tier \
  --name main \
  --query properties.outputs

# Step 4 — Clean up when done
az group delete --name rg-bicep-3tier --yes --no-wait
```

---

## Deployment Output

After running the deploy command, Bicep automatically surfaces:

```json
{
  "appUrl": "https://app-p08-rkgzkmw4e3sqi.azurewebsites.net",
  "vnetName": "vnet-project08"
}
```

No manual searching through the portal. The outputs tell you everything you need.

---

## Key Learnings

- **Modularity matters** — splitting each resource into its own .bicep file makes the code readable, testable, and reusable across projects
- **Repeatability is the point** — IaC removes the risk of environment drift; every deployment is identical
- **Outputs replace manual discovery** — instead of navigating the portal after deployment, Bicep prints exactly what you need
- **Version control for infrastructure** — every change to the architecture is tracked in Git, with a full history of what changed and when
- **uniqueString() is essential** — Azure resource names must be globally unique; this function solves that automatically

---

*Built as part of a structured cloud portfolio targeting Cloud Architect and Cloud Consulting roles in Dublin, Ireland.*
