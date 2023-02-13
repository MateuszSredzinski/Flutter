import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import './cart_screen.dart';
import '../providers/products.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 34,
            width: 250,
            child: Image.asset(
              'assets/images/noszeniaki.com.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        // leading: SizedBox(
        //   height: 32,
        //   width: 60,
        //   child: Image.asset(
        //     'assets/images/noszeniaki.com.png',
        //     fit: BoxFit.cover,
        //     height: 32,
        //   ),
        // ),

        // title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Tylko ulubione'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Pokaż wszystko'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(_showOnlyFavorites),
    );
  }
}

// Widget _buildProductsList() {
//     Widget content;
//     return ScopedModelDescendant(
//       builder: (BuildContext context, Widget child, ProductsModel model) {
//         if (model.displayedProducts.length > 0 && !model.isLoading) {
//           content = Products();
//         } else if (model.isLoading) {
//           content = Center(child: CircularProgressIndicator());
//         } else {
//           content = ListView(children: [
//             Container(
//               height: 300.0,
//               child: Center(
//                 child: Text('No products found.'),
//               ),
//             ),
//           ]);
//         }
//         return RefreshIndicator(child: content, onRefresh: model.fetchProducts);
//       },
//     );
//   }