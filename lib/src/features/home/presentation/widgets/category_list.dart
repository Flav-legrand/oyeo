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
            separatorBuilder: (_, _) => const SizedBox(width: spacing),
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
                     color: const Color(0xFFF5F5F5),
                     borderRadius: BorderRadius.circular(22),
                     border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                   ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [

                       const SizedBox(height: 14),
                       Text(
                         category.label,
                         textAlign: TextAlign.center,
                         style: const TextStyle(
                           color: Colors.black,
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
