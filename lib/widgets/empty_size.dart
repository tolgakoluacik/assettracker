import 'package:flutter/material.dart';

class EmptySize extends SizedBox {
  const EmptySize({
    double super.width = 0,
    double super.height = 0,
    super.key,
  });

  /// Empty Sizes
  /// tiny -> width: 4, height: 4
  static const EmptySize tiny = EmptySize(width: 4, height: 4);
  /// small -> width: 8, height: 8
  static const EmptySize small = EmptySize(width: 8, height: 8);
  /// medium -> width: 16, height: 16
  static const EmptySize medium = EmptySize(width: 16, height: 16);
  /// height -> width: 32, height: 32
  static const EmptySize large = EmptySize(width: 32, height: 32);
}