@echo off
echo 🚀 Déploiement de Oyeo Mobi...

echo 🧹 Nettoyage...
call flutter clean
rmdir /s /q build\web

echo 🏗️  Build de la nouvelle version...
call flutter pub get
call flutter build web --release --base-href "/Oyeo_Mobi/"

echo 📁 Copie des fichiers...
set DEPLOY_DIR=..\test1-Android
rmdir /s /q %DEPLOY_DIR%
mkdir %DEPLOY_DIR%
xcopy /e /i /y build\web\* %DEPLOY_DIR%\

echo 📤 Push vers GitHub...
cd %DEPLOY_DIR%
git add .
git commit -m "✨ Nouvelle version avec grille 2x2 occasions"
git push origin main

echo ✅ Déploiement terminé !
echo 🌐 Site accessible sur : https://flav-legrand.github.io/Oyeo_Mobi/
pause