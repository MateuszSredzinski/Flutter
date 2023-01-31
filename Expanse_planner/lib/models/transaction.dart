import 'package:flutter/foundation.dart';
//this is library for required

class Transaction {
  final String title;
  final double amonut;
  final DateTime date;
  final String id;

  Transaction({
    required this.title,
    required this.amonut,
    required this.date,
    required this.id,
  });
}
