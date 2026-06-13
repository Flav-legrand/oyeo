import 'package:flutter/material.dart';
import 'package:test1/src/core/constants/app_strings.dart';
import 'package:test1/src/features/home/data/home_data.dart';

import 'widgets/category_list.dart';
import 'widgets/oye_search_bar.dart';
import 'widgets/product_card.dart';

import 'package:test1/src/features/home/domain/product.dart';
import 'package:test1/src/features/catalogues/pages/catalogue_page.dart';
import 'package:test1/src/features/catalogues/pages/compte_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Fonction utilitaire pour la navigation avec transition de droite à gauche
  void _navigateWithSlideTransition(Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0); // Départ de la GAUCHE
          const end = Offset.zero; // Arrivée au centre
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ).then((_) {
      setState(() {});
    });
  }

  // Widget pour l'icône Menu stylée (Option 2 : Carte avec séparateur)
  Widget _buildStyledMenuIcon({bool isSelected = false}) {
    final color = isSelected ? const Color(0xFFF95F00) : Colors.grey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icône Menu
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.menu,
              size: 18,
              color: color,
            ),
          ),
          const SizedBox(width: 8),
          // Séparateur vertical
          Container(
            width: 1,
            height: 20,
            color: Colors.grey.shade300,
          ),
          const SizedBox(width: 8),
          // Icône Recherche
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.search,
              size: 18,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFFFF),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Accueil'),
          BottomNavigationBarItem(
              icon: _buildStyledMenuIcon(isSelected: _selectedIndex == 1),
              label: 'Catalogue'
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Panier'),
          const BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favoris'),
          const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Compte'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 1) {
            _navigateWithSlideTransition(const CataloguePage());
          } else if (index == 4) {
            _navigateWithSlideTransition(const ComptePage());
          } else {
            setState(() => _selectedIndex = index);
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFF95F00),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Section sombre - Header (scrollable)
              Container(
                width: double.infinity,
                color: const Color(0xFF1A2A3A),
                padding: const EdgeInsets.all(16),
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
                          children: const [
                            Icon(Icons.notifications_none, color: Colors.white, size: 22),
                            SizedBox(width: 12),
                            Icon(Icons.favorite_border, color: Colors.white, size: 22),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 16, color: Colors.white70),
                        const SizedBox(width: 6),
                        const Text(
                          'Brazzaville',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
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
                      ],
                    ),
                    const SizedBox(height: 20),
                    const OyeSearchBar(),
                  ],
                ),
              ),
              // Section blanche - Contenu scrollable
              Padding(
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
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final itemWidth = constraints.maxWidth / 3;
                        return Row(
                          children: HomeData.tags.map((tag) {
                            return SizedBox(
                              width: itemWidth,
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                                ),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    tag,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.black),
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
                        color: Colors.black,
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
                        final itemWidth = 160.0;
                        final itemHeight = 280.0;

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
                                height: itemHeight,
                                child: ProductCard(
                                  product: item,
                                  compact: true,
                                  offer: false,
                                ),
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
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey.shade200, width: 1),
                                ),
                                child: Text(
                                  trend,
                                  style: const TextStyle(
                                    color: Colors.black54,
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
                    _PartnerOffersSection(),
                    const SizedBox(height: 40),
                    const GoodDealsSection(),
                    const SizedBox(height: 24),
                    const _BestBrandsPromoCard(),
                    const SizedBox(height: 40),
                    const Text(
                      'Mode et bien etre',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: 340,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.shade100,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _DealProductCard(
                                title: 'Poêle anti-adhésive',
                                brand: 'CookPro',
                                price: '\$18',
                                originalPrice: '525',
                                discount: '-28%',
                                rating: 5,
                                reviews: 210,
                                icon: Icons.kitchen,
                              ),
                              const SizedBox(width: 12),
                              _DealProductCard(
                                title: 'Casque BT Ultra',
                                brand: 'SoundPro',
                                price: '\$44',
                                originalPrice: '574',
                                discount: '-40%',
                                rating: 4,
                                reviews: 312,
                                icon: Icons.headphones,
                              ),
                              const SizedBox(width: 12),
                              _DealProductCard(
                                title: 'Montre Connectée',
                                brand: 'TechWear',
                                price: '\$35',
                                originalPrice: '89',
                                discount: '-50%',
                                rating: 5,
                                reviews: 145,
                                icon: Icons.watch,
                              ),
                              const SizedBox(width: 12),
                              _DealProductCard(
                                title: 'Powerbank 20W',
                                brand: 'ChargePro',
                                price: '\$22',
                                originalPrice: '59',
                                discount: '-35%',
                                rating: 4,
                                reviews: 287,
                                icon: Icons.power,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const OccasionSection(),
                  ],
                ),
              ),
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
            color: Colors.black,
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
        _pages.add(
          HomeData.offersProducts.sublist(i, HomeData.offersProducts.length),
        );
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
                  color: Colors.black,
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
        SizedBox(
          height: 670,
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
                  childAspectRatio: 160 / 280,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: pageProducts.map((product) {
                    return Container(
                      constraints: const BoxConstraints(
                        minWidth: 160,
                        maxWidth: 160,
                        minHeight: 280,
                        maxHeight: 280,
                      ),
                      child: ProductCard(
                        product: product,
                        compact: true,
                        offer: true,
                      ),
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
                        : Colors.grey.shade300,
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
      0: [
        // AntiGaspi
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
      1: [
        // Supermarché
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
      2: [
        // Services
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

    final secondaryItems =
        itemsByCategory[_selectedIndex] ?? itemsByCategory[0]!;

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
              color: Colors.black,
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
                    padding: EdgeInsets.only(
                      right: index < secondaryItems.length - 1 ? 10 : 0,
                    ),
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

class _PartnerOffersSection extends StatelessWidget {
  const _PartnerOffersSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Offres partenaires',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        // Offre 1
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFFF5F5F5),
            ),
            child: Image.asset(
              'assets/images/Offre 1.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback : afficher un placeholder attrayant
                return Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2C3E50), Color(0xFF1A2A3A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Hello, Neo.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'MacBook Neo',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'En 1 fois',
                                style: TextStyle(
                                  color: Color(0xFF2563EB),
                                  fontSize: 12,
                                ),
                              ),
                              const Text(
                                '699€',
                                style: TextStyle(
                                  color: Color(0xFF2563EB),
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'En 4 fois',
                                style: TextStyle(
                                  color: Color(0xFF2563EB),
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    '179€',
                                    style: TextStyle(
                                      color: Color(0xFF2563EB),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    '37',
                                    style: TextStyle(
                                      color: Color(0xFF2563EB),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Voir plus',
                                style: TextStyle(
                                  color: Color(0xFF2563EB),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Offres 2 - Contenu scrollable
        const Text(
          '',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 340,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade100,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _DealProductCard(
                    title: 'Poêle anti-adhésive',
                    brand: 'CookPro',
                    price: '\$18',
                    originalPrice: '525',
                    discount: '-28%',
                    rating: 5,
                    reviews: 210,
                    icon: Icons.kitchen,
                  ),
                  const SizedBox(width: 12),
                  _DealProductCard(
                    title: 'Casque BT Ultra',
                    brand: 'SoundPro',
                    price: '\$44',
                    originalPrice: '574',
                    discount: '-40%',
                    rating: 4,
                    reviews: 312,
                    icon: Icons.headphones,
                  ),
                  const SizedBox(width: 12),
                  _DealProductCard(
                    title: 'Montre Connectée',
                    brand: 'TechWear',
                    price: '\$35',
                    originalPrice: '89',
                    discount: '-50%',
                    rating: 5,
                    reviews: 145,
                    icon: Icons.watch,
                  ),
                  const SizedBox(width: 12),
                  _DealProductCard(
                    title: 'Powerbank 20W',
                    brand: 'ChargePro',
                    price: '\$22',
                    originalPrice: '59',
                    discount: '-35%',
                    rating: 4,
                    reviews: 287,
                    icon: Icons.power,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DealProductCard extends StatelessWidget {
  final String brand;
  final String title;
  final String price;
  final String originalPrice;
  final String discount;
  final int rating;
  final int reviews;
  final IconData icon;

  const _DealProductCard({
    required this.brand,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header: Deal badge + Heart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5EEAD4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Deal',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(Icons.favorite_border, color: Colors.grey[300], size: 16),
              ],
            ),
            const SizedBox(height: 8),
            // Product icon
            Container(
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.grey[400], size: 40),
            ),
            const SizedBox(height: 8),
            // Discount badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFEF4444),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                discount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6),
            // Brand
            Text(
              brand,
              style: TextStyle(color: Colors.grey[600], fontSize: 11),
            ),
            // Title
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Rating
            Row(
              children: [
                Row(
                  children: List.generate(
                    5,
                        (i) => Icon(
                      Icons.star,
                      color: i < rating ? Colors.amber : Colors.grey[300],
                      size: 11,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '($reviews)',
                  style: TextStyle(color: Colors.grey[600], fontSize: 9),
                ),
              ],
            ),
            const SizedBox(height: 6),
            // Price
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  originalPrice,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 10,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Action buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      backgroundColor: const Color(0xFFEFF6FF),
                    ),
                    child: const Text(
                      'Ajouter',
                      style: TextStyle(
                        color: Color(0xFF2563EB),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEC4899),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Acheter',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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

  const _ServiceItem({required this.label, required this.icon});
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
        color: const Color(0xFFF5F5F5),
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
        border: isSelected
            ? null
            : Border.all(color: Colors.white12, width: 0.5),
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
          color: const Color(0xFFF5F5F5),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: const Color(0xFFF5F5F5));
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
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
  final String? discount;
  final String? price;
  final String? originalPrice;
  final String? timeLabel;

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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image de fond
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFF5F5F5),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
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
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.8),
                    ],
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
                          const Icon(
                            Icons.history,
                            color: Colors.white,
                            size: 14,
                          ),
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

class _BestBrandsPromoCard extends StatelessWidget {
  const _BestBrandsPromoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: const Color(0xFF1A2A3A),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'DÉCOUVREZ LES MEILLEURES\nMARQUES',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Des produits de qualité à prix réduits',
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF0B1322),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Découvrir',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF8B4969), Color(0xFF5C2E4A)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: const Text(
              '50%',
              style: TextStyle(
                color: Color(0xFFD18BA8),
                fontSize: 48,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GoodDealsSection extends StatelessWidget {
  const GoodDealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // On prend 4 produits pour la grille (2x2)
    final deals = HomeData.offersProducts.take(4).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Les bonnes affaires de la semaine",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: const Color(0xFF0F1724),
            padding: const EdgeInsets.all(12),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.78,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: deals.map((p) => _GoodDealCard(product: p)).toList(),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _GoodDealCard extends StatelessWidget {
  final Product product;

  const _GoodDealCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A2230),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image produit (si disponible)
            if (product.imageAsset.isNotEmpty)
              Image.asset(
                product.imageAsset,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: const Color(0xFF1A2230));
                },
              )
            else
              Container(color: const Color(0xFF1A2230)),
            // Overlay dégradé bas
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 90,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.75)],
                  ),
                ),
              ),
            ),
            // Badge "En ligne" en haut à gauche
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text(
                  'En ligne',
                  style: TextStyle(
                    color: Color(0xFF0B1322),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            // Badge de remise (si présente)
            if (product.discount != null)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF3B30),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    product.discount!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            // Texte bas : titre, état et prix
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Small category / état
                  Text(
                    product.category,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  // Nom / titre
                  Text(
                    product.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  // Prix (mise en avant)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.price,
                        style: const TextStyle(
                          color: Color(0xFF22C55E),
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      // petit badge "Voir" ou icone
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.chevron_right, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OccasionSection extends StatelessWidget {
  const OccasionSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilisez HomeData.secondHandProducts si vous l'avez ajouté,
    // sinon basculez sur une autre source, ex: HomeData.featuredProducts.take(2)
    final items = HomeData.secondHandProducts;
    if (items.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header: titre + "Voir tout"
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Occasions',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Seconde main · Reconditionnés',
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Voir tout ›',
                style: TextStyle(color: Color(0xFFF95F00)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Filtre chips (Tous, Comme neuf, Bon état, Reconditionné)
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _FilterChip(label: 'Tous', selected: true),
              const SizedBox(width: 8),
              _FilterChip(label: 'Comme neuf'),
              const SizedBox(width: 8),
              _FilterChip(label: 'Bon état'),
              const SizedBox(width: 8),
              _FilterChip(label: 'Reconditionné'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Liste horizontale de cartes
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final product = items[index];
            return _OccasionGridCard(product: product);
          },
        ),
      ],
    );
  }
}

class _OccasionGridCard extends StatelessWidget {
  final Product product;

  const _OccasionGridCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A2230),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Partie image (prend 60% de la hauteur)
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.asset(
                    product.imageAsset,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF2A3448),
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.white54,
                            size: 40,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Badge "Occasion" en haut à gauche
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFA726),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Occasion',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Badge note (si disponible)
                if (product.rating != null)
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            product.rating!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Partie informations (prend 40% de la hauteur)
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nom et catégorie
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            size: 12,
                            color: Color(0xFF22C55E),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              product.category,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Prix et bouton
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.price,
                        style: const TextStyle(
                          color: Color(0xFF22C55E),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: double.infinity,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF95F00),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Voir détail',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _FilterChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFF95F00) : const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.white70,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
        ),
      ),
    );
  }
}