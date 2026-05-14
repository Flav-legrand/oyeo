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