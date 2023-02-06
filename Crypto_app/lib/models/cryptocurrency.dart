import 'package:flutter/foundation.dart';

enum MarketCapPlace {
  High,
  Medium,
  Low,
}

enum Affordability {
  High,
  Medium,
  Low,
}

class CryptoCurrency {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> info;
  final List<String> steps;
  final int duration;
  final MarketCapPlace marketCapPlace;
  final Affordability affordability;
  final bool isProofOfWork;
  final bool isProofOfStake;
  final bool isProofOfauthority;
  final bool isStableCoins;
  final bool isProofOfSpace;

  const CryptoCurrency({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.info,
    required this.steps,
    required this.duration,
    required this.marketCapPlace,
    required this.affordability,
    required this.isProofOfWork,
    required this.isProofOfStake,
    required this.isProofOfauthority,
    required this.isStableCoins,
    required this.isProofOfSpace,
  });
}
