import 'dart:convert';

import 'currency_model.dart';

class Currencies {
  final Map<String, Currency> currencyMap;

  Currencies({required this.currencyMap});

  factory Currencies.fromJson(String source) {
    final Map<String, dynamic> jsonData = json.decode(source);
    final Map<String, Currency> currencies = {};

    jsonData.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        currencies[key] = Currency.fromJson(value);
      }
    });

    return Currencies(currencyMap: currencies);
  }
}