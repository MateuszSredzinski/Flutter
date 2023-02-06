import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:crypto_app_flutter/screens/crypto_detail_screen.dart';

import '../models/cryptocurrency.dart';

class CryptoItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final MarketCapPlace marketCapPlace;
  final Affordability affordability;

  CryptoItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.marketCapPlace,
    required this.affordability,
  });

  String get affordabilityText {
    switch (affordability) {
      case Affordability.High:
        return 'High';
      case Affordability.Medium:
        return 'Medium';
      case Affordability.Low:
        return 'Low';
    }
  }

  String get marketCapPlaceText {
    switch (marketCapPlace) {
      case MarketCapPlace.High:
        return 'High';
      case MarketCapPlace.Medium:
        return 'Medium';
      case MarketCapPlace.Low:
        return 'Low';
    }
  }

  void selectCrypto(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
          CryptoDetailScreen.routeName,
          arguments: id,
        )
        .then((result) => {print(result)});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCrypto(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 15,
                child: Container(
                  width: 340,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 26, color: Colors.white54),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '$duration min',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.currency_exchange,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      affordabilityText,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.bar_chart,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      marketCapPlaceText,
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
