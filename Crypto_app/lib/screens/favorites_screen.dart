import 'package:flutter/material.dart';
import 'package:crypto_app_flutter/models/cryptocurrency.dart';
import 'package:crypto_app_flutter/widgets/crypto_item.dart';

import '../models/cryptocurrency.dart';

class FavoritesScreen extends StatelessWidget {
  final List<CryptoCurrency> favoriteCrypto;

  FavoritesScreen(this.favoriteCrypto);

  @override
  Widget build(BuildContext context) {
    if (favoriteCrypto.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return CryptoItem(
            id: favoriteCrypto[index].id,
            title: favoriteCrypto[index].title,
            imageUrl: favoriteCrypto[index].imageUrl,
            duration: favoriteCrypto[index].duration,
            affordability: favoriteCrypto[index].affordability,
            marketCapPlace: favoriteCrypto[index].marketCapPlace,
          );
        },
        itemCount: favoriteCrypto.length,
      );
    }
  }
}
