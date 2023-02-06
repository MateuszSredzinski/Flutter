import 'package:flutter/material.dart';
import 'package:crypto_app_flutter/data/crypto_data.dart';
import 'package:crypto_app_flutter/models/cryptocurrency.dart';
import 'package:crypto_app_flutter/screens/categories_screen.dart';
import 'package:crypto_app_flutter/screens/category_algorithms_screen.dart';

import './screens/tabs_screen.dart';
import 'screens/crypto_detail_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'Pow': false,
    'PoS': false,
    'PoA': false,
    'stable': false,
  };
  List<CryptoCurrency> _availableCrypto = CRYPTOCURRENCY_MODELS;
  List<CryptoCurrency> _favoriteCrypto = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableCrypto = CRYPTOCURRENCY_MODELS.where((crypto) {
        if (_filters['PoW']! && !crypto.isProofOfWork) {
          return false;
        }
        if (_filters['PoS']! && !crypto.isProofOfStake) {
          return false;
        }
        if (_filters['PoA']! && !crypto.isProofOfauthority) {
          return false;
        }
        if (_filters['stable']! && !crypto.isStableCoins) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String cryptoId) {
    final existingIndex =
        _favoriteCrypto.indexWhere((crypto) => crypto.id == cryptoId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteCrypto.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteCrypto.add(
          CRYPTOCURRENCY_MODELS.firstWhere((crypto) => crypto.id == cryptoId),
        );
      });
    }
  }

  bool _isCryptoFavorite(String id) {
    return _favoriteCrypto.any((crypto) => crypto.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Cryptocurrency Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.grey,
        canvasColor: Colors.white,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w500,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteCrypto),
        CategoryAlgorithmsScreen.routeName: (context) =>
            CategoryAlgorithmsScreen(_availableCrypto),
        CryptoDetailScreen.routeName: (context) =>
            CryptoDetailScreen(_toggleFavorite, _isCryptoFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
