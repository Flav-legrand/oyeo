# deploy_web.ps1 - Déploiement Flutter Web sur GitHub
param(
    [string]$GitHubUsername = "flav-legrand",
    [string]$RepoName = "Oyeo_Mobi",
    [string]$Branch = "main"
)

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "   DEPLOIEMENT FLUTTER WEB - GITHUB PAGES" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

$DeployDir = "..\$($RepoName)_web_deploy"

Write-Host "Configuration :" -ForegroundColor Yellow
Write-Host "  - Utilisateur : $GitHubUsername"
Write-Host "  - Repository : $RepoName"
Write-Host "  - Branche : $Branch"
Write-Host ""

# 1. Nettoyage
Write-Host "[1/7] Nettoyage des anciens builds..." -ForegroundColor Yellow
flutter clean
if (Test-Path "build\web") { Remove-Item -Recurse -Force "build\web" }
if (Test-Path $DeployDir) { Remove-Item -Recurse -Force $DeployDir }
Write-Host "OK" -ForegroundColor Green
Write-Host ""

# 2. Dépendances
Write-Host "[2/7] Installation des dépendances..." -ForegroundColor Yellow
flutter pub get
Write-Host "OK" -ForegroundColor Green
Write-Host ""

# 3. Build web
Write-Host "[3/7] Construction de la version web..." -ForegroundColor Yellow
flutter build web --release --base-href "/$RepoName/"
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERREUR: Le build a échoué" -ForegroundColor Red
    pause
    exit 1
}
Write-Host "OK" -ForegroundColor Green
Write-Host ""

# 4. Copie
Write-Host "[4/7] Copie des fichiers générés..." -ForegroundColor Yellow
New-Item -ItemType Directory -Force -Path $DeployDir | Out-Null
Copy-Item -Recurse -Force "build\web\*" $DeployDir
Write-Host "OK" -ForegroundColor Green
Write-Host ""

# 5. Configuration GitHub Pages
Write-Host "[5/7] Configuration pour GitHub Pages..." -ForegroundColor Yellow
New-Item -ItemType File -Force -Path "$DeployDir\.nojekyll" | Out-Null
Write-Host "OK" -ForegroundColor Green
Write-Host ""

# 6. Push GitHub
Write-Host "[6/7] Déploiement vers GitHub..." -ForegroundColor Yellow
Push-Location $DeployDir

# Vérifie si déjà un dépôt git
if (-not (Test-Path ".git")) {
    Write-Host "Initialisation du dépôt Git..."
    git init
    git branch -M $Branch
}

git add .
git commit -m "Déploiement web $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

# Ajoute le remote s'il n'existe pas
$remotes = git remote
if ($remotes -notcontains "origin") {
    git remote add origin "https://github.com/$GitHubUsername/$RepoName.git"
}

git push -f origin $Branch
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERREUR: Push vers GitHub échoué" -ForegroundColor Red
    Pop-Location
    pause
    exit 1
}
Pop-Location
Write-Host "OK" -ForegroundColor Green
Write-Host ""

# 7. Finalisation
Write-Host "[7/7] Configuration GitHub Pages..." -ForegroundColor Yellow
Write-Host ""
Write-Host "==============================================" -ForegroundColor Green
Write-Host "   DEPLOIEMENT TERMINE AVEC SUCCES !" -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Votre site sera en ligne dans 2-3 minutes :" -ForegroundColor Cyan
Write-Host "https://$GitHubUsername.github.io/$RepoName/" -ForegroundColor Yellow
Write-Host ""
Write-Host "Pour activer GitHub Pages (à faire la première fois) :" -ForegroundColor Yellow
Write-Host "1. Allez sur : https://github.com/$GitHubUsername/$RepoName/settings/pages"
Write-Host "2. Source : 'Deploy from a branch'"
Write-Host "3. Branche : $Branch (dossier / racine)"
Write-Host "4. Cliquez sur 'Save'"
Write-Host ""
Write-Host "Pour les prochains déploiements, relancez simplement ce script !" -ForegroundColor Cyan
Write-Host ""

pause
