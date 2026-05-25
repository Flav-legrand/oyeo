import 'package:flutter/material.dart';

import '../domain/product.dart';

class CategoryItem {
  final IconData icon;
  final String label;

  const CategoryItem({required this.icon, required this.label});
}

class HomeData {
  static const tags = [
    'Offres flash',
    'Services rapides',
    'Vendeurs vérifiés',
  ];

  static const categories = <CategoryItem>[
    CategoryItem(icon: Icons.phone_iphone, label: 'Électronique'),
    CategoryItem(icon: Icons.checkroom, label: 'Mode'),
    CategoryItem(icon: Icons.home, label: 'Maison'),
    CategoryItem(icon: Icons.kitchen, label: 'Cuisine'),
    CategoryItem(icon: Icons.brush, label: 'Beauté'),
    CategoryItem(icon: Icons.menu_book, label: 'Livres'),
  ];

  static final featuredProducts = <Product>[
    Product(
      name: 'Caméra de surveillance 4K',
      category: 'Sécurité · Wi-Fi',
      price: '149 €',
      badge: 'Top caméra',
      rating: '4,7/5',
      imageAsset: 'assets/images/camera.png',
    ),
    Product(
      name: 'APPLE iPhone 14 128GB',
      category: 'Reconditionné · Excellent',
      price: '999 €',
      badge: 'Promo',
      rating: '4,0/5',
      imageAsset: 'assets/images/iphone14.png',
    ),
    Product(
      name: 'Friteuse sans huile NINJA • Foodi AF200E',
      category: 'Reconditionné · Bon plan',
      price: '179 €',
      badge: 'Bon plan',
      rating: '4,8/5',
      imageAsset: 'assets/images/ninja_airfryer.png',
    ),
    Product(
      name: 'VACTech Balai sans fil',
      category: 'Reconditionné · Plus réel',
      price: '129 €',
      badge: 'Plus réel',
      rating: '4,5/5',
      imageAsset: 'assets/images/vactech_broom.png',
    ),
  ];

  static final offersProducts = <Product>[
    Product(
      name: 'Smartphone Samsung Galaxy A54',
      category: 'Smartphone',
      price: '329 €',
      badge: 'Offre',
      discount: '-24%',
      imageAsset: 'assets/images/samsung_a54.png',
    ),
    Product(
      name: 'Baskets Nike Air Max',
      category: 'Chaussures',
      price: '119 €',
      badge: 'Offre',
      discount: '-40%',
      imageAsset: 'assets/images/nike_air_max.png',
    ),
    Product(
      name: 'Smartphone Samsung Galaxy A54',
      category: 'Smartphone',
      price: '329 €',
      badge: 'Offre',
      discount: '-24%',
      imageAsset: 'assets/images/samsung_a54.png',
    ),
    Product(
      name: 'Baskets Nike Air Max',
      category: 'Chaussures',
      price: '119 €',
      badge: 'Offre',
      discount: '-40%',
      imageAsset: 'assets/images/nike_air_max.png',
    ),
    Product(
      name: 'Smartphone Samsung Galaxy A54',
      category: 'Smartphone',
      price: '329 €',
      badge: 'Offre',
      discount: '-24%',
      imageAsset: 'assets/images/samsung_a54.png',
    ),
    Product(
      name: 'Baskets Nike Air Max',
      category: 'Chaussures',
      price: '119 €',
      badge: 'Offre',
      discount: '-40%',
      imageAsset: 'assets/images/nike_air_max.png',
    ),
    Product(
      name: 'Smartphone Samsung Galaxy A54',
      category: 'Smartphone',
      price: '329 €',
      badge: 'Offre',
      discount: '-24%',
      imageAsset: 'assets/images/samsung_a54.png',
    ),
    Product(
      name: 'Baskets Nike Air Max',
      category: 'Chaussures',
      price: '119 €',
      badge: 'Offre',
      discount: '-40%',
      imageAsset: 'assets/images/nike_air_max.png',
    ),
    Product(
      name: 'Smartphone Samsung Galaxy A54',
      category: 'Smartphone',
      price: '329 €',
      badge: 'Offre',
      discount: '-24%',
      imageAsset: 'assets/images/samsung_a54.png',
    ),
    Product(
      name: 'Baskets Nike Air Max',
      category: 'Chaussures',
      price: '119 €',
      badge: 'Offre',
      discount: '-40%',
      imageAsset: 'assets/images/nike_air_max.png',
    ),
    Product(
      name: 'Smartphone Samsung Galaxy A54',
      category: 'Smartphone',
      price: '329 €',
      badge: 'Offre',
      discount: '-24%',
      imageAsset: 'assets/images/samsung_a54.png',
    ),
    Product(
      name: 'Baskets Nike Air Max',
      category: 'Chaussures',
      price: '119 €',
      badge: 'Offre',
      discount: '-40%',
      imageAsset: 'assets/images/nike_air_max.png',
    ),
  ];

  static final secondHandProducts = <Product>[
  Product(
    name: 'iPhone 12 Pro',
    category: 'Comme neuf',
    price: '350 000 F',
    badge: 'Occasion',
    rating: '4,6/5',
    imageAsset: 'assets/images/oyeo2.png', // remplacez par votre image
  ),
  Product(
    name: 'Samsung TV 55"',
    category: 'Bon état',
    price: '280 000 F',
    badge: 'Occasion',
    rating: '4,4/5',
    imageAsset: 'assets/images/oyeo.png', // remplacez par votre image
  ),
  // Ajoutez d'autres éléments si besoin
];
}
