import 'dart:math';

import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/cryptocurrency.dart';
import '../widgets/crypto_item.dart';
import '../models/cryptocurrency.dart';

import '../data/crypto_data.dart';

class CategoryAlgorithmsScreen extends StatefulWidget {
  static const routeName = '/categories';

  final List<CryptoCurrency> availableCrypto;

  CategoryAlgorithmsScreen(this.availableCrypto);

  @override
  State<CategoryAlgorithmsScreen> createState() =>
      _CategoryAlgorithmsScreenState();
}

class _CategoryAlgorithmsScreenState extends State<CategoryAlgorithmsScreen> {
  late String categoryTitle;
  late List<CryptoCurrency> displayedCrypto;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id'];
      displayedCrypto = widget.availableCrypto.where((crypto) {
        return crypto.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String cryptoId) {
    setState(() {
      displayedCrypto.removeWhere((crypto) => crypto.id == cryptoId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consensus $categoryTitle'),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return CryptoItem(
              id: displayedCrypto[index].id,
              title: displayedCrypto[index].title,
              imageUrl: displayedCrypto[index].imageUrl,
              duration: displayedCrypto[index].duration,
              marketCapPlace: displayedCrypto[index].marketCapPlace,
              affordability: displayedCrypto[index].affordability,
            );
          },
          itemCount: displayedCrypto.length),
      //widget which display variable crypto when we choose category
    );
  }
}
