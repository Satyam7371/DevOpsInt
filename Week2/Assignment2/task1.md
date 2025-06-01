✅ 1. Linux and Windows Virtual Machines (SSH & RDP Access)
Deployed a Linux VM in Azure using Ubuntu image.

Verified connectivity using SSH (ssh azureuser@<public-ip>).

Deployed a Windows Server VM.

Connected using RDP from local machine.

Both VMs were placed in the same virtual network and allowed access via NSG rules.

✅ Result: Successfully connected to both VMs via SSH (Linux) and RDP (Windows).

✅ 2. App Service Plan & Web App Deployment
Created an App Service Plan (Standard Tier).

Provisioned a Web App using the plan.

Deployed a basic HTML welcome page via the Azure portal.

✅ Result: The Web App URL shows a working welcome page (https://<webappname>.azurewebsites.net).

✅ 3. Azure Container Registry (ACR) and Container Deployment
Created ACR named myacrproject.

Tagged and pushed a custom Docker image (Node.js app).

Pulled the image into Azure and used it to deploy a container.

✅ Result: Container created from ACR image and running successfully on Azure.

✅ 4. Azure Container Instance & Container Group
Deployed the Docker container in Azure Container Instance (ACI).

Created a container group with environment variables and exposed ports.

Validated that the container was publicly accessible via IP.

✅ Result: ACI runs the container with exposed endpoint accessible and functional.

✅ 5. Virtual Network Architecture
A. Single VNet with Subnets

Created VNet1 with two subnets:

Subnet-1: Hosted Linux and Windows VMs

Subnet-2: Reserved for future SQL DB deployment

B. Hub and Spoke Model

Created 4 VNets:

Management (Hub), Production, Testing, and Development (Spokes)

Configured peering between Management VNet and others.

Launched VMs in each VNet and enabled ICMP.

From the Management VM, successfully pinged all others.

✅ Result: Hub-and-Spoke VNet architecture is working. Verified full connectivity.

✅ 6. Internal and External Load Balancer
Set up 2 VMs in the backend pool.

External Load Balancer: Assigned public IP, used health probe and rule on port 80.

Internal Load Balancer: No public IP, used for internal VM-to-VM traffic.

✅ Result: Load balancing confirmed using curl and browser — requests were distributed across VMs.

✅ 7. Azure Application Gateway
Created Application Gateway with:

Frontend IP

Backend pool (2 web apps)

HTTP listener

Health probes

Successfully routed traffic and verified health probes.

✅ Result: Application Gateway routing requests and showing healthy backend status.

✅ 8. Domain and DNS Server Setup
Set up a custom domain on Azure.

Deployed a Linux VM to act as a DNS server (BIND).

Configured DNS records to forward domain traffic to a VM web server.

✅ Result: Domain successfully resolves to VM, and DNS routing confirmed via dig/nslookup.
