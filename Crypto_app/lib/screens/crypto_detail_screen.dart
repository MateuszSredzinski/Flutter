import 'package:flutter/material.dart';
import '../data/crypto_data.dart';
import '../models/cryptocurrency.dart';
import '../models/category.dart';

class CryptoDetailScreen extends StatelessWidget {
  static const routeName = '/crypto-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  CryptoDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 180,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cryptoId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal =
        CRYPTOCURRENCY_MODELS.firstWhere((meal) => meal.id == cryptoId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            buildSectionTitle(context, 'Description'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.info[index])),
                ),
                itemCount: selectedMeal.info.length,
              ),
            ),
            buildSectionTitle(context, 'Facts'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider() //tiny lines beetween
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(cryptoId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(cryptoId),
      ),
    );
  }
}
