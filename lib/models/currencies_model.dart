import '../constants/app_currencies.dart';
import 'currency_model.dart';

class Currencies {
  final Map<String, CurrencyData> currencies;

  Currencies({required this.currencies});

  factory Currencies.fromJson(Map<String, dynamic> json) {
    Map<String, CurrencyData> currencyMap = {};
    List<dynamic> data = json['data'];

    for (var item in data) {
      String code = item['code'];

      if (AppCurrencies.currencies.containsKey(code)) {
        currencyMap[code] = CurrencyData.fromJson(item);
      }
    }

    return Currencies(currencies: currencyMap);
  }
}