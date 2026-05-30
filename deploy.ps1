#!/bin/bash

echo "🚀 Déploiement de Oyeo Mobi..."

# Nettoyage
echo "🧹 Nettoyage..."
flutter clean
rm -rf build/web

# Build
echo "🏗️  Build de la nouvelle version..."
flutter pub get
flutter build web --release --base-href "/Oyeo_Mobi/"

# Copie vers le dépôt GitHub Pages
echo "📁 Copie des fichiers..."
rm -rf ../Oyeo_Mobi/*
cp -r build/web/* ../Oyeo_Mobi/

# Commit et push
echo "📤 Push vers GitHub..."
cd ../Oyeo_Mobi
git add .
git commit -m "✨ Nouvelle version avec grille 2x2 occasions"
git push origin main

echo "✅ Déploiement terminé !"
echo "🌐 Site accessible sur : https://flav-legrand.github.io/Oyeo_Mobi/"