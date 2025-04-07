# Terraform Azure – Déploiement d'une VM avec CI/CD

## 🎯 Objectif

Ce projet a pour but de déployer une infrastructure simple sur Azure à l'aide de **Terraform** et d'un pipeline **GitHub Actions**. L'infrastructure inclut notamment :
- Un groupe de ressources
- Un réseau virtuel (VNet) avec sous-réseau
- Une adresse IP publique
- Une interface réseau (NIC)
- Un NSG (pare-feu)
- Une machine virtuelle Linux avec clé SSH

Le projet inclut également un workflow automatisé pour **détruire l'infrastructure** à la demande.

---

## 🚀 Technologies utilisées

- **Terraform** v1.x
- **Azure CLI**
- **GitHub Actions**
- **Backend distant** via Azure Storage

---

## 🧱 Structure du projet

```bash
terraform/
│
├── backend.tf           # Configuration du backend distant (Azure Storage)
├── providers.tf         # Configuration des providers
├── rg.tf                # Groupe de ressources
├── vnet.tf              # Réseau virtuel
├── subnet.tf            # Sous-réseau
├── nsg.tf               # NSG et interface réseau
├── public_ip.tf         # IP publique
├── vm.tf                # Machine virtuelle
├── variables.tf         # Variables d'entrée
├── terraform.yml        # Workflow GitHub Actions (apply)
└── destroy.yml          # Workflow GitHub Actions (destroy)
```

---

## ⚙️ CI/CD avec GitHub Actions

### 🔐 Secrets utilisés

Pour permettre au workflow d'accéder à Azure, les secrets suivants ont été créés dans le repo GitHub (`Settings > Secrets > Actions`) :

| Nom               | Description                          |
|------------------|--------------------------------------|
| `CLIENT_ID`       | ID de l'app du Service Principal     |
| `CLIENT_SECRET`   | Mot de passe du Service Principal    |
| `TENANT_ID`       | ID du tenant Azure                   |
| `SUBSCRIPTION_ID` | ID de l’abonnement Azure             |
| `ID_RSA`          | Clé publique SSH pour la VM          |

### 📥 Déploiement (`terraform.yml`)

Le workflow s'exécute automatiquement à chaque `push` sur la branche `main`. Il effectue les étapes suivantes :
- `terraform init`
- `terraform plan`
- `terraform apply`

### 🧹 Destruction (`destroy.yml`)

Un workflow déclenchable manuellement via GitHub (`Actions > Destroy > Run workflow`) qui exécute :
- `terraform init`
- `terraform destroy -auto-approve`

---

## ✅ Résultat attendu

- Une VM Linux déployée automatiquement avec une IP publique
- Une infra complète créée dans le groupe `smontri-resources`
- Un backend Terraform distant (fichier `.tfstate` stocké dans Azure Storage)
- Un processus CI/CD propre et reproductible

---

## 🧪 Commandes utiles (en local)

```bash
az login
az group list -o table
az vm list -o table
az network public-ip list -o table
```

---

## 👤 Auteur

Projet réalisé par **Josué Bayidikila** – dans le cadre du cours DevCloud (YNOV M2) 🌩️
