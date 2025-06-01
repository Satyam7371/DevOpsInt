

* Deploy a Docker app via ACI
* Set up a multi-container group
* Verify networking and functionality

---

## ✅ 1. Deploy a Simple Docker App via ACI

Use a public image like NGINX:

```bash
az container create \
  --resource-group myResourceGroup \
  --name simplewebapp \
  --image nginx \
  --dns-name-label acisimpleweb2025 \
  --ports 80
```

✅ *Container instance 'simplewebapp' running.*

Access URL: `http://acisimpleweb2025.eastus.azurecontainer.io`

---

## ✅ 2. Verify Deployment

```bash
curl http://acisimpleweb2025.eastus.azurecontainer.io
```

**Expected Output:**

```html
Welcome to nginx!
```

✅ *NGINX served successfully from ACI.*

---

## ✅ 3. Create Container Group (Multi-Container)

We'll deploy a group with two containers: NGINX and a simple app using BusyBox for logging.

```bash
az container create \
  --resource-group myResourceGroup \
  --name container-group-demo \
  --image nginx \
  --ports 80 \
  --ip-address Public \
  --restart-policy OnFailure \
  --command-line ""
```

Now add a sidecar logging container (via YAML):

**container-group.yaml:**

```yaml
apiVersion: 2018-10-01
location: eastus
tags: null
properties:
  containers:
  - name: web
    properties:
      image: nginx
      ports:
      - port: 80
      resources:
        requests:
          cpu: 1.0
          memoryInGb: 1.5
  - name: logger
    properties:
      image: busybox
      command: ['sh', '-c', 'while true; do echo container log test; sleep 10; done']
      resources:
        requests:
          cpu: 0.5
          memoryInGb: 0.5
  osType: Linux
  ipAddress:
    type: Public
    ports:
    - protocol: tcp
      port: 80
```

```bash
az container create \
  --resource-group myResourceGroup \
  --file container-group.yaml \
  --name multicontainergroup
```

✅ *Container group 'multicontainergroup' created with 2 containers.*

---

## ✅ 4. Test Group Functionality

* Access NGINX via public IP (check `az container show`)
* Inspect logs:

```bash
az container logs --resource-group myResourceGroup --name multicontainergroup --container-name logger
```

**Expected Logs:**

```bash
container log test
container log test
...
```

✅ *Both containers running and functioning as expected.*

---

**Status: ✅ Container instance & container group setup and verified.**
