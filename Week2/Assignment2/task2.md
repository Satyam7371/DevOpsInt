

---

## ✅ 1. Create App Service Plan

```bash
az appservice plan create \
  --name MyAppServicePlan \
  --resource-group myResourceGroup \
  --sku B1 \
  --is-linux
```

✅ *App Service Plan 'MyAppServicePlan' created using Basic (B1) pricing tier on Linux.*

---

## ✅ 2. Create a Web App in the App Service Plan

```bash
az webapp create \
  --resource-group myResourceGroup \
  --plan MyAppServicePlan \
  --name myinternwebapp123 \
  --runtime "NODE|18-lts" \
  --deployment-local-git
```

✅ *Web App 'myinternwebapp123' created and ready for deployment.*

Returned output includes:

* Git remote URL (for pushing code)
* Web App live URL: `https://myinternwebapp123.azurewebsites.net`

---

## ✅ 3. Prepare a Simple Welcome Page

**welcome.html:**

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Welcome</title>
  </head>
  <body>
    <h1>Welcome to My Azure Web App!</h1>
    <p>Deployed via CLI during internship project.</p>
  </body>
</html>
```

---

## ✅ 4. Deploy Web App via Git

```bash
# Initialize local repo
git init

# Add files and commit
cp welcome.html index.html
echo "web: node index.html" > Procfile
git add .
git commit -m "Initial commit - welcome page"

# Add Azure Git remote (from output of az webapp create)
git remote add azure https://<your-deployment-url>

# Push to deploy
git push azure master
```

✅ *Deployment completed. Web App shows the welcome page.*

---

## ✅ 5. Confirm Deployment

Access the live app:

```bash
curl https://myinternwebapp123.azurewebsites.net
```

**Expected Output:**

```html
<h1>Welcome to My Azure Web App!</h1>
<p>Deployed via CLI during internship project.</p>
```

✅ *Deployment verified successfully via browser and curl.*

---

