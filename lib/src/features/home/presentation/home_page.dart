import 'package:flutter/material.dart';
import 'package:test1/src/core/constants/app_strings.dart';
import 'package:test1/src/features/home/data/home_data.dart';

import 'widgets/category_list.dart';
import 'widgets/oye_search_bar.dart';
import 'widgets/product_card.dart';

import 'package:test1/src/features/home/domain/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final surface = const Color(0xFF101826);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF0B1322),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            16,
            20,
            16,
            20 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF95F00),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Center(
                            child: Text(
                              'O',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Oyéo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Utilisateur',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            _ActionIcon(icon: Icons.favorite_border),
                            const SizedBox(width: 8),
                            _ActionIcon(icon: Icons.notifications_none),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        _LabelChip(
                          icon: Icons.location_on_outlined,
                          label: 'Brazzaville',
                          backgroundColor: const Color(0xFF161D31),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Livrer à : Bacongo',
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.yellow, size: 18),
                            SizedBox(width: 6),
                            Text(
                              '120 pts',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              const OyeSearchBar(),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = constraints.maxWidth / 3;
                  return Row(
                    children: HomeData.tags.map((tag) {
                      return SizedBox(
                        width: itemWidth,
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF101826),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              tag,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 24),
              const Text(
                categoriesTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              CategoryList(categories: HomeData.categories),
              const SizedBox(height: 24),
              _PromoCard(),
              const SizedBox(height: 16),
              Center(
                child: Container(
                  width: 42,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              _SectionHeader(title: 'Offres du jour', actionLabel: 'Voir tout'),
              const SizedBox(height: 18),
              LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = constraints.maxWidth >= 900
                      ? 220.0
                      : constraints.maxWidth >= 600
                      ? 190.0
                      : 170.0;
                  final itemHeight = constraints.maxWidth >= 600
                      ? 280.0
                      : 260.0;
                  return SizedBox(
                    height: itemHeight,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: HomeData.featuredProducts.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        final item = HomeData.featuredProducts[index];
                        return SizedBox(
                          width: itemWidth,
                          child: ProductCard(product: item, compact: true),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              _SectionHeader(
                title: 'Tendances du moment',
                actionLabel: 'Voir tout',
              ),
              const SizedBox(height: 16),
              Builder(
                builder: (context) {
                  final trends = [
                    'Lego',
                    'Bon plan',
                    'High-Tech',
                    'Vêtements',
                    'Maison',
                    'Beauté',
                  ];
                  return SizedBox(
                    height: 58,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: trends.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final trend = trends[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF161D31),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white12, width: 1),
                          ),
                          child: Text(
                            trend,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              _PagedOffersGrid(),
              const SizedBox(height: 40),
              const SizedBox(height: 20),
              _QuickAccessSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;

  const _ActionIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFF121E30),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }
}

class _LabelChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;

  const _LabelChip({
    required this.icon,
    required this.label,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.white70),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  const _PromoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6B5E), Color(0xFF9E44F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'Boutiques officielles',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Marques & garanties',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Retours faciles • Livraison • Prix compétitifs • Vendeurs certifiés',
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF0B1322),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 14,
                  ),
                ),
                child: const Text('Explorer'),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                ),
                child: const Text('Voir promotions'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String actionLabel;

  const _SectionHeader({required this.title, required this.actionLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(onPressed: () {}, child: Text(actionLabel)),
      ],
    );
  }
}
// ============================================================
// WIDGET : PAGEVIEW 2x2 POUR LES OFFRES (SCROLL HORIZONTAL)
// ============================================================
class _PagedOffersGrid extends StatefulWidget {
  @override
  State<_PagedOffersGrid> createState() => _PagedOffersGridState();
}

class _PagedOffersGridState extends State<_PagedOffersGrid> {
  late final PageController _pageController;
  int _currentPage = 0;
  late final List<List<Product>> _pages;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Grouper les produits par lots de 4 (2x2)
    _pages = [];
    for (int i = 0; i < HomeData.offersProducts.length; i += 4) {
      final end = i + 4;
      if (end <= HomeData.offersProducts.length) {
        _pages.add(HomeData.offersProducts.sublist(i, end));
      } else {
        _pages.add(HomeData.offersProducts.sublist(i, HomeData.offersProducts.length));
      }
    }

    // Écouter les changements de page
    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;
      if (newPage != _currentPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_pages.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titre de la section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Offres spéciales',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Voir tout →',
                style: TextStyle(
                  color: Color(0xFFF95F00),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        // PageView pour le scroll horizontal page par page
        SizedBox(
          height: 480,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: _pages.length,
            itemBuilder: (context, pageIndex) {
              final pageProducts = _pages[pageIndex];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: pageProducts.map((product) {
                    return ProductCard(
                      product: product,
                      compact: true,
                      offer: true,
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),

        // Indicateur de page (dots)
        if (_pages.length > 1)
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _currentPage == index ? 20 : 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: _currentPage == index
                        ? const Color(0xFFF95F00)
                        : Colors.white24,
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}

class _QuickAccessSection extends StatefulWidget {
  const _QuickAccessSection();

  @override
  State<_QuickAccessSection> createState() => _QuickAccessSectionState();
}

class _QuickAccessSectionState extends State<_QuickAccessSection> {
  int _selectedIndex = 1; // Catégories est sélectionné par défaut

  @override
  Widget build(BuildContext context) {
    final primaryItems = [
      ('AntiGaspi', Icons.person_outline),
      ('Super Marché', Icons.category_outlined),
      ('Service', Icons.storefront_outlined),
    ];

    // Liste des services (utilise _ServiceItem et _ServiceChip)
    final serviceItems = [
      _ServiceItem(label: 'Ménage', icon: Icons.cleaning_services),
      _ServiceItem(label: 'Plomberie', icon: Icons.plumbing),
      _ServiceItem(label: 'Électricité', icon: Icons.electrical_services),
      _ServiceItem(label: 'Maçonnerie', icon: Icons.construction),
      _ServiceItem(label: 'Livraison', icon: Icons.local_shipping),
      _ServiceItem(label: 'Informatique', icon: Icons.computer),
    ];

    // Items différents selon la sélection
    final itemsByCategory = {
      0: [ // AntiGaspi
        _SecondaryAccessItem(
          label: 'Lot fruits & légumes',
          imagePath: 'assets/images/Antigaspi.png',
          discount: '-56%',
          price: '3 500 F',
          originalPrice: '6 000 F',
          timeLabel: 'Plus que 5',
        ),
        _SecondaryAccessItem(
          label: 'Panier surprise',
          imagePath: 'assets/images/Antigaspi.png',
          discount: '-58%',
          price: '5 000 F',
          originalPrice: '12 000 F',
          timeLabel: 'Plus que 3',
        ),
        _SecondaryAccessItem(
          label: 'Lot boulangerie',
          imagePath: 'assets/images/Antigaspi.png',
          discount: '-45%',
          price: '2 500 F',
          originalPrice: '4 500 F',
          timeLabel: 'Plus que 8',
        ),
        _SecondaryAccessItem(
          label: 'Pack frais du jour',
          imagePath: 'assets/images/Antigaspi.png',
          discount: '-50%',
          price: '4 000 F',
          originalPrice: '8 000 F',
          timeLabel: 'Plus que 4',
        ),
      ],
      1: [ // Supermarché
        _SecondaryAccessItem(
          label: 'Salon',
          imagePath: 'assets/images/vos acces rapide.png',
        ),
        _SecondaryAccessItem(
          label: 'Chambre',
          imagePath: 'assets/images/vos acces rapide.png',
        ),
        _SecondaryAccessItem(
          label: 'Mode femme',
          imagePath: 'assets/images/vos acces rapide.png',
        ),
        _SecondaryAccessItem(
          label: 'Denim',
          imagePath: 'assets/images/vos acces rapide.png',
        ),
      ],
      2: [ // Services
        _SecondaryAccessItem(
          label: 'Ménage',
          imagePath: 'assets/images/Service.png',
        ),
        _SecondaryAccessItem(
          label: 'Plomberie',
          imagePath: 'assets/images/Service.png',
        ),
        _SecondaryAccessItem(
          label: 'Électricité',
          imagePath: 'assets/images/Service.png',
        ),
        _SecondaryAccessItem(
          label: 'Maçonnerie',
          imagePath: 'assets/images/Service.png',
        ),
        _SecondaryAccessItem(
          label: 'Livraison',
          imagePath: 'assets/images/Service.png',
        ),
        _SecondaryAccessItem(
          label: 'Informatique',
          imagePath: 'assets/images/Service.png',
        ),
      ],
    };

    final secondaryItems = itemsByCategory[_selectedIndex] ?? itemsByCategory[0]!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF101826),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Vos accès rapides',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          // Primary chips row
          Row(
            children: List.generate(primaryItems.length, (index) {
              final (label, icon) = primaryItems[index];
              final isSelected = _selectedIndex == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedIndex = index),
                  child: _PrimaryAccessChip(
                    icon: icon,
                    label: label,
                    isSelected: isSelected,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          // Super Marché: grille de catégories + bouton d'action
          if (_selectedIndex == 1) ...[
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                _SuperMarketCategoryCard(
                  label: 'Épicerie',
                  imagePath: 'assets/images/Super Marché.png',
                ),
                _SuperMarketCategoryCard(
                  label: 'Boissons',
                  imagePath: 'assets/images/Super Marché.png',
                ),
                _SuperMarketCategoryCard(
                  label: 'Viandes',
                  imagePath: 'assets/images/Super Marché.png',
                ),
                _SuperMarketCategoryCard(
                  label: 'Fruits',
                  imagePath: 'assets/images/Super Marché.png',
                ),
                _SuperMarketCategoryCard(
                  label: 'Hygiène',
                  imagePath: 'assets/images/Super Marché.png',
                ),
                _SuperMarketCategoryCard(
                  label: 'Bébé',
                  imagePath: 'assets/images/Super Marché.png',
                ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
                label: const Text('Faire mes courses'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
          ] else if (_selectedIndex == 2) ...[
            // Afficher les services en grille 3 colonnes (comme l'image)
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: serviceItems.map((s) {
                return _ServiceChip(label: s.label, icon: s.icon);
              }).toList(),
            ),
          ] else ...[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(secondaryItems.length, (index) {
                  final item = secondaryItems[index];
                  return Padding(
                    padding: EdgeInsets.only(right: index < secondaryItems.length - 1 ? 10 : 0),
                    child: _SecondaryAccessChip(
                      label: item.label,
                      imagePath: item.imagePath,
                      discount: item.discount,
                      price: item.price,
                      originalPrice: item.originalPrice,
                      timeLabel: item.timeLabel,
                    ),
                  );
                }),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SecondaryAccessItem {
  final String label;
  final String imagePath;
  final String? discount;
  final String? price;
  final String? originalPrice;
  final String? timeLabel;

  const _SecondaryAccessItem({
    required this.label,
    required this.imagePath,
    this.discount,
    this.price,
    this.originalPrice,
    this.timeLabel,
  });
}
class _ServiceItem {
  final String label;
  final IconData icon;

  const _ServiceItem({
    required this.label,
    required this.icon,
  });
}
class _ServiceChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const _ServiceChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF161D31),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12, width: 0.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFFF95F00), size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
class _PrimaryAccessChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const _PrimaryAccessChip({
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1A1A1A) : const Color(0xFF1A2A3A),
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? null : Border.all(color: Colors.white12, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: Colors.white70),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _SuperMarketCategoryCard extends StatelessWidget {
  final String label;
  final String imagePath;

  const _SuperMarketCategoryCard({
    required this.label,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF161D31),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFF161D31),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
                ),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondaryAccessChip extends StatelessWidget {
  final String label;
  final String imagePath;
  final String? discount; // Badge de réduction (-56%, etc)
  final String? price; // Prix réduit
  final String? originalPrice; // Prix barré
  final String? timeLabel; // "Plus que 5"

  const _SecondaryAccessChip({
    required this.label,
    required this.imagePath,
    this.discount,
    this.price,
    this.originalPrice,
    this.timeLabel,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 120,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image de fond
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFF161D31),
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
            // Badge de réduction (haut gauche)
            if (discount != null)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF22C55E),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    discount!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            // Overlay avec les informations (bas)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // "Plus que X" avec horloge
                    if (timeLabel != null)
                      Row(
                        children: [
                          const Icon(Icons.history, color: Colors.white, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            timeLabel!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 4),
                    // Titre du produit
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Prix
                    if (price != null)
                      Row(
                        children: [
                          Text(
                            price!,
                            style: const TextStyle(
                              color: Color(0xFF22C55E),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (originalPrice != null) ...[
                            const SizedBox(width: 4),
                            Text(
                              originalPrice!,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}


