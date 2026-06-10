import 'package:flutter/material.dart';

class ComptePage extends StatelessWidget {
  const ComptePage({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFF5F5F5);  // Même couleur que le catalogue
    const accentColor = Color(0xFFF95F00); // Orange OYÉO

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          'Compte',
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
            // Titre Compte (comme MODE dans catalogue)
            const Text(
              'Compte',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 16),

            // Groupe de cartes (style identique au catalogue)
            Column(
              children: [
                // Espace Client
                _buildNavItem(
                  title: 'Espace Client',
                  subtitle: 'Profil • Adresses',
                  icon: Icons.person,
                  onTap: () {},
                ),
                const SizedBox(height: 12),

                // Vos Commandes
                _buildNavItem(
                  title: 'Vos Commandes',
                  subtitle: 'Suivi • Retours',
                  icon: Icons.shopping_bag,
                  onTap: () {},
                ),
                const SizedBox(height: 12),

                // Favoris
                _buildNavItem(
                  title: 'Favoris',
                  subtitle: 'Produits & Prestataires',
                  icon: Icons.favorite,
                  onTap: () {},
                ),
                const SizedBox(height: 12),

                // Support
                _buildNavItem(
                  title: 'Support',
                  subtitle: 'Aide • Chat',
                  icon: Icons.support_agent,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Style identique aux cartes du catalogue
  Widget _buildNavItem({
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
          color: Colors.white,  // Fond blanc comme les cartes catalogue
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200, width: 1),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.1),  // Orange transparent comme catalogue
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: accentColor,  // Orange comme catalogue
              size: 22,
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