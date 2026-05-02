import 'package:flutter/material.dart';
import 'package:test1/src/features/home/data/home_data.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryItem> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 12.0;
        const itemWidth = 150.0;

        return SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: spacing),
            itemBuilder: (context, index) {
              final category = categories[index];
              return SizedBox(
                width: itemWidth,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF101826),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFF151D2B),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          category.icon,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        category.label,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
