# -----------------------------
# deploy.ps1 — Windows PowerShell
# -----------------------------

# 1️⃣ Задаём переменные окружения вручную
$env:VAULT_ADDR = "http://127.0.0.1:8200"
$env:VAULT_ROLE_ID = "ad251170-bfae-1b99-d205-874ca8f9385c"   # твой AppRole ID
$env:VAULT_SECRET_ID = "60904654-41b5-acbf-dd1e-09e0b0967336" # твой Secret ID

Write-Host "VAULT_ADDR: $env:VAULT_ADDR"
Write-Host "VAULT_ROLE_ID: $env:VAULT_ROLE_ID"
Write-Host "VAULT_SECRET_ID: $env:VAULT_SECRET_ID"

# 2️⃣ Получаем токен AppRole
Write-Host "Authenticating to Vault via AppRole..."
$env:VAULT_TOKEN = vault write -field=token auth/approle/login `
    role_id=$env:VAULT_ROLE_ID `
    secret_id=$env:VAULT_SECRET_ID

Write-Host "Vault token acquired: $($env:VAULT_TOKEN.Substring(0,8))..." # только первые 8 символов

# 3️⃣ Проверяем аутентификацию (опционально)
vault token lookup $env:VAULT_TOKEN

# 4️⃣ Подстановка секретов через vals (KV v2)
$valsInput = @"
DB_USER: ref+vault+kv2://secrets/db#username
DB_PASSWORD: ref+vault+kv2://secrets/db#password
DB_NAME: ref+vault+kv2://secrets/db#database
"@

Write-Host "`nEvaluating secrets via vals..."
$valsInput | vals eval -
