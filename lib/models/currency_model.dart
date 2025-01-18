class CurrencyData {
  final String code;
  final double alis;
  final double satis;
  final String tarih;
  final Map<String, String> dir;
  final double dusuk;
  final double yuksek;
  final double kapanis;

  CurrencyData({
    required this.code,
    required this.alis,
    required this.satis,
    required this.tarih,
    required this.dir,
    required this.dusuk,
    required this.yuksek,
    required this.kapanis,
  });

  factory CurrencyData.fromJson(Map<String, dynamic> json) {
    return CurrencyData(
      code: json['code'],
      alis: json['alis'].toDouble(),
      satis: json['satis'].toDouble(),
      tarih: json['tarih'],
      dir: Map<String, String>.from(json['dir']),
      dusuk: json['dusuk'].toDouble(),
      yuksek: json['yuksek'].toDouble(),
      kapanis: json['kapanis'].toDouble(),
    );
  }
}