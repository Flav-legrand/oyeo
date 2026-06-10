// catalogue_page.dart modifié

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
            const Text(
              'MODE',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 16),

            // Femme (sans navigation spécifique pour l'instant)
            _buildCategoryCard(
              title: 'Femme',
              subtitle: 'Vêtements • Chaussures • Sacs',
              icon: Icons.female,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Homme (avec navigation vers HommePage)
            _buildCategoryCard(
              title: 'Homme',
              subtitle: 'Vêtements • Chaussures • Accessoires',
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

            // Enfants
            _buildCategoryCard(
              title: 'Enfants',
              subtitle: 'Bébé • Fille • Garçon',
              icon: Icons.child_care,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Outlet
            _buildCategoryCard(
              title: 'Outlet',
              subtitle: 'Promos • fin de série',
              icon: Icons.local_offer,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Seconde vie
            _buildCategoryCard(
              title: 'Seconde vie',
              subtitle: 'Occasion • reconditionné',
              icon: Icons.replay,
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
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: accentColor, size: 24),
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