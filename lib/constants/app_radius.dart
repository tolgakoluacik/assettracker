import 'package:flutter/material.dart';

class AppRadius {
  /// xSmall -> Radius.circular(4)
  static const Radius xSmall = Radius.circular(2);

  /// small -> Radius.circular(4)
  static const Radius small = Radius.circular(4);

  /// medium -> Radius.circular(8)
  static const Radius medium = Radius.circular(8);

  /// large -> Radius.circular(16)
  static const Radius large = Radius.circular(16);

  /// custom -> Radius.circular([radius])
  static Radius custom(double radius) => Radius.circular(radius);
}