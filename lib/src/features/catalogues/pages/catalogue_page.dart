
import 'package:flutter/material.dart';
import 'package:test1/src/features/catalogues/pages/homme_page.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFF5F5F5);
    const accentColor = Color(0xFFF95F00);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          'Catalogue',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre "Nos catégories"
            const Text(
              'Nos catégories',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 16),

            // Femme
            _buildCategoryCard(
              title: 'Femme',
              subtitle: 'Femme • Homme • Enfants',
              icon: Icons.female,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Homme (avec navigation)
            _buildCategoryCard(
              title: 'Homme',
              subtitle: 'Prêt-À-Porter • Chaussures • Accessoires',
              icon: Icons.male,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HommePage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),

            // Enfant & Bébé
            _buildCategoryCard(
              title: 'Enfant & Bébé',
              subtitle: 'Vêtements • Jouets • Puériculture',
              icon: Icons.child_care,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Beauté & Bien-Être
            _buildCategoryCard(
              title: 'Beauté & Bien-Être',
              subtitle: 'Maquillage • Parfums • Soins Corps',
              icon: Icons.spa,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Maison
            _buildCategoryCard(
              title: 'Maison',
              subtitle: 'Déco • Mobilier • Électroménager',
              icon: Icons.home,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // High-Tech
            _buildCategoryCard(
              title: 'High-Tech',
              subtitle: 'Smartphones • PC • TV & Son',
              icon: Icons.computer,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // École & Bureau
            _buildCategoryCard(
              title: 'École & Bureau',
              subtitle: 'Fournitures • Papeterie • Écriture',
              icon: Icons.school,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Matériaux & Outillage
            _buildCategoryCard(
              title: 'Matériaux & Outillage',
              subtitle: 'Bricolage • Outils • Quincaillerie',
              icon: Icons.build,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Automobile
            _buildCategoryCard(
              title: 'Automobile',
              subtitle: 'Pièces • Entretien • Accessoires',
              icon: Icons.directions_car,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Occasions
            _buildCategoryCard(
              title: 'Occasions',
              subtitle: 'Seconde Main • Bonnes Affaires',
              icon: Icons.replay,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Supermarché
            _buildCategoryCard(
              title: 'Supermarché',
              subtitle: 'Épicerie • Hygiène • Bébé',
              icon: Icons.store,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // AntiGaspi
            _buildCategoryCard(
              title: 'AntiGaspi',
              subtitle: 'Offres Proches • Dates Courtes',
              icon: Icons.timer,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Carte Cadeaux
            _buildCategoryCard(
              title: 'Carte Cadeaux',
              subtitle: 'Offrir & Activer',
              icon: Icons.card_giftcard,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Diaspora
            _buildCategoryCard(
              title: 'Diaspora',
              subtitle: 'Découvrir Les Offres',
              icon: Icons.public,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Don & Solidarité
            _buildCategoryCard(
              title: 'Don & Solidarité',
              subtitle: 'Soutenir Les Projets Locaux',
              icon: Icons.favorite,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    const accentColor = Color(0xFFF95F00);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200, width: 1),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: accentColor,
              size: 24,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
          trailing: Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ),
      ),
    );
  }
}