
This document captures actual CLI steps to:

* Create a VNet with two subnets
* Deploy Linux, Windows VM & SQL
* Build Hub & Spoke with 4 VNets
* Enable peering and verify VM connectivity
* Create Internal and External Load Balancers
* ✅ Create and Test Azure Application Gateway

---

## ✅ A. Create a VNet with 2 Subnets

```bash
az network vnet create \
  --resource-group myResourceGroup \
  --name myMainVnet \
  --address-prefix 10.0.0.0/16 \
  --subnet-name LinuxWinSubnet \
  --subnet-prefix 10.0.1.0/24

az network vnet subnet create \
  --resource-group myResourceGroup \
  --vnet-name myMainVnet \
  --name SQLSubnet \
  --address-prefix 10.0.2.0/24
```

✅ *VNet 'myMainVnet' created with Subnet1 (LinuxWin) and Subnet2 (SQL).*

### Deploy Linux VM in Subnet-1

```bash
az vm create \
  --resource-group myResourceGroup \
  --name LinuxVM \
  --vnet-name myMainVnet \
  --subnet LinuxWinSubnet \
  --image UbuntuLTS \
  --admin-username azureuser \
  --generate-ssh-keys
```

### Deploy Windows VM in Subnet-1

```bash
az vm create \
  --resource-group myResourceGroup \
  --name WindowsVM \
  --vnet-name myMainVnet \
  --subnet LinuxWinSubnet \
  --image Win2019Datacenter \
  --admin-username azureuser \
  --admin-password 'P@ssword123456'
```

### Deploy SQL Server in Subnet-2

```bash
az vm create \
  --resource-group myResourceGroup \
  --name SQLServerVM \
  --vnet-name myMainVnet \
  --subnet SQLSubnet \
  --image MicrosoftSQLServer:sql2019-ws2019:enterprise:latest \
  --admin-username azureuser \
  --admin-password 'P@ssword123456'
```

✅ *Linux, Windows, and SQL VMs provisioned in appropriate subnets.*

---

## ✅ B. Create 4 VNets (Hub-Spoke Setup)

```bash
# Create Hub VNet
az network vnet create \
  --name mgmt-hub-vnet \
  --resource-group myResourceGroup \
  --address-prefix 10.10.0.0/16 \
  --subnet-name mgmt-subnet \
  --subnet-prefix 10.10.1.0/24

# Create 3 Spoke VNets
az network vnet create --name prod-vnet --resource-group myResourceGroup --address-prefix 10.11.0.0/16 --subnet-name prod-subnet --subnet-prefix 10.11.1.0/24

az network vnet create --name test-vnet --resource-group myResourceGroup --address-prefix 10.12.0.0/16 --subnet-name test-subnet --subnet-prefix 10.12.1.0/24

az network vnet create --name dev-vnet --resource-group myResourceGroup --address-prefix 10.13.0.0/16 --subnet-name dev-subnet --subnet-prefix 10.13.1.0/24
```

✅ *Hub and three spoke VNets created.*

---

## ✅ C. Configure Peering (Hub ⇄ Spokes)

```bash
# Peer HUB → PROD
az network vnet peering create \
  --name hub-to-prod \
  --resource-group myResourceGroup \
  --vnet-name mgmt-hub-vnet \
  --remote-vnet prod-vnet \
  --allow-vnet-access

# Peer PROD → HUB
az network vnet peering create \
  --name prod-to-hub \
  --resource-group myResourceGroup \
  --vnet-name prod-vnet \
  --remote-vnet mgmt-hub-vnet \
  --allow-vnet-access

# Repeat for test and dev
# hub-to-test, test-to-hub
# hub-to-dev, dev-to-hub
```

✅ *Hub and spoke VNets fully peered.*

---

## ✅ D. Deploy One VM in Each VNet

```bash
# Example for Production
az vm create --resource-group myResourceGroup --name ProdVM --vnet-name prod-vnet --subnet prod-subnet --image UbuntuLTS --admin-username azureuser --generate-ssh-keys

# Repeat for test and dev VMs
```

### Deploy VM in Hub (Management)

```bash
az vm create --resource-group myResourceGroup --name MgmtVM --vnet-name mgmt-hub-vnet --subnet mgmt-subnet --image UbuntuLTS --admin-username azureuser --generate-ssh-keys
```

✅ *VMs launched in all VNets.*

---

## ✅ E. Test Connectivity from Management VM

SSH into Management VM:

```bash
ssh azureuser@<MgmtVM-IP>
```

Ping all other VMs:

```bash
ping 10.11.1.4  # Prod VM
ping 10.12.1.4  # Test VM
ping 10.13.1.4  # Dev VM
```

✅ *All VMs reachable via ICMP from Hub.*

---

## ✅ F. Create External Load Balancer

### Create Public IP

```bash
az network public-ip create \
  --resource-group myResourceGroup \
  --name myPublicIP \
  --sku Standard
```

### Create Load Balancer

```bash
az network lb create \
  --resource-group myResourceGroup \
  --name myExternalLB \
  --sku Standard \
  --frontend-ip-name myFrontEnd \
  --backend-pool-name myBackEndPool \
  --public-ip-address myPublicIP
```

### Add Load Balancing Rule

```bash
az network lb rule create \
  --resource-group myResourceGroup \
  --lb-name myExternalLB \
  --name httpRule \
  --protocol tcp \
  --frontend-port 80 \
  --backend-port 80 \
  --frontend-ip-name myFrontEnd \
  --backend-pool-name myBackEndPool
```

✅ *External Load Balancer created and rules configured.*

---

## ✅ G. Create Internal Load Balancer

```bash
az network lb create \
  --resource-group myResourceGroup \
  --name myInternalLB \
  --sku Standard \
  --frontend-ip-name myIntFrontEnd \
  --backend-pool-name myIntBackEndPool \
  --vnet-name myMainVnet \
  --subnet LinuxWinSubnet \
  --private-ip-address 10.0.1.50
```

### Add LB Rule for Internal Traffic

```bash
az network lb rule create \
  --resource-group myResourceGroup \
  --lb-name myInternalLB \
  --name internalRule \
  --protocol tcp \
  --frontend-port 80 \
  --backend-port 80 \
  --frontend-ip-name myIntFrontEnd \
  --backend-pool-name myIntBackEndPool
```

✅ *Internal Load Balancer configured for internal traffic.*

---

## ✅ H. Create and Test Azure Application Gateway

```bash
az network public-ip create \
  --resource-group myResourceGroup \
  --name appGwPublicIP \
  --sku Standard

az network application-gateway create \
  --name myAppGateway \
  --location eastus \
  --resource-group myResourceGroup \
  --capacity 2 \
  --sku Standard_v2 \
  --http-settings-cookie-based-affinity Disabled \
  --frontend-port 80 \
  --public-ip-address appGwPublicIP \
  --vnet-name myMainVnet \
  --subnet LinuxWinSubnet
```

### Test Gateway

Open the public IP of the Application Gateway in the browser:

```bash
az network public-ip show \
  --resource-group myResourceGroup \
  --name appGwPublicIP \
  --query "ipAddress" \
  --output tsv
```

✅ *App Gateway is live and routing traffic to backend pool (e.g., VMs or App Service).*
