class Currency {
  final String code;
  final double? alis;
  final double? satis;
  final String tarih;
  final double? dusuk;
  final double? yuksek;
  final double? kapanis;

  Currency({
    required this.code,
    this.alis,
    this.satis,
    required this.tarih,
    this.dusuk,
    this.yuksek,
    this.kapanis,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'] ?? '',
      alis: (json['alis'] != null) ? double.tryParse(json['alis'].toString()) : null,
      satis: (json['satis'] != null) ? double.tryParse(json['satis'].toString()) : null,
      tarih: json['tarih'] ?? '',
      dusuk: (json['dusuk'] != null) ? double.tryParse(json['dusuk'].toString()) : null,
      yuksek: (json['yuksek'] != null) ? double.tryParse(json['yuksek'].toString()) : null,
      kapanis: (json['kapanis'] != null) ? double.tryParse(json['kapanis'].toString()) : null,
    );
  }
}