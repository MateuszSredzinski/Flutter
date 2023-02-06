import 'package:flutter/material.dart';

import '../data/crypto_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: CRYPTO_CATEGORIES
          .map(((eProp) => CategoryItem(
                eProp.title,
                eProp.color,
                eProp.id,
              )))
          .toList(),
    );
  }
}
