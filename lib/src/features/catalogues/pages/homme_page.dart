
import 'package:flutter/material.dart';

class HommePage extends StatelessWidget {
  const HommePage({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFF5F5F5);  // Même couleur que la section blanche
    const accentColor = Color(0xFFF95F00); // Orange de l'app

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          'HOMME',
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
            // ==================== SECTION HOMME ====================
            const Text(
              'HOMME',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 16),

            // Vêtements
            _buildCategoryCard(
              title: 'Vêtements',
              subtitle: 'T-shirts, chemises, jeans...',
              icon: Icons.checkroom,
            ),
            const SizedBox(height: 12),

            // Chaussures
            _buildCategoryCard(
              title: 'Chaussures',
              subtitle: 'Baskets, ville, sandales',
              icon: Icons.shopping_bag,
            ),
            const SizedBox(height: 12),

            // Sacs & accessoires
            _buildCategoryCard(
              title: 'Sacs & accessoires',
              subtitle: 'Ceintures, casquettes...',
              icon: Icons.backpack,
            ),
            const SizedBox(height: 12),

            // Montres & bijoux
            _buildCategoryCard(
              title: 'Montres & bijoux',
              subtitle: 'Montres, bracelets',
              icon: Icons.watch,
            ),
            const SizedBox(height: 12),

            // Grooming
            _buildCategoryCard(
              title: 'Grooming',
              subtitle: 'Barbe, soins',
              icon: Icons.face_retouching_natural,
            ),
          ],
        ),
      ),
    );
  }

  // Carte avec fond blanc et bordure (comme les sections de l'accueil)
  Widget _buildCategoryCard({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    const accentColor = Color(0xFFF95F00);

    return GestureDetector(
      onTap: () {
        // Navigation vers la sous-catégorie (à implémenter)
        // Exemple : Navigator.push(context, MaterialPageRoute(builder: (context) => VetementsPage()));
      },
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