class Currency {
  final String code;
  final double? buy;
  final double? sell;
  final String date;
  final double? low;
  final double? high;
  final double? end;

  Currency({
    required this.code,
    this.buy,
    this.sell,
    required this.date,
    this.low,
    this.high,
    this.end,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'] ?? '',
      buy: (json['alis'] != null) ? double.tryParse(json['alis'].toString()) : null,
      sell: (json['satis'] != null) ? double.tryParse(json['satis'].toString()) : null,
      date: json['tarih'] ?? '',
      low: (json['dusuk'] != null) ? double.tryParse(json['dusuk'].toString()) : null,
      high: (json['yuksek'] != null) ? double.tryParse(json['yuksek'].toString()) : null,
      end: (json['kapanis'] != null) ? double.tryParse(json['kapanis'].toString()) : null,
    );
  }
}