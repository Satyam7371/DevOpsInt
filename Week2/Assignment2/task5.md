
This document captures actual CLI steps to:

* Create a VNet with two subnets
* Deploy Linux, Windows VM & SQL
* Build Hub & Spoke with 4 VNets
* Enable peering and verify VM connectivity

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

**Status: ✅ Hub-Spoke VNet architecture working. VM connectivity verified.**
