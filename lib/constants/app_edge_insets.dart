import 'package:flutter/material.dart';

class ResponsiveAppEdgeInsets {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  static EdgeInsets get smallPadding => EdgeInsets.symmetric(vertical: screenWidth * 0.02, horizontal: screenWidth * 0.04);
  static EdgeInsets get mediumPadding => EdgeInsets.symmetric(vertical: screenWidth * 0.04, horizontal: screenWidth * 0.08);
  static EdgeInsets get largePadding => EdgeInsets.symmetric(vertical: screenWidth * 0.08, horizontal: screenWidth * 0.16);

  static EdgeInsets get smallMargin => EdgeInsets.all(screenWidth * 0.02);
  static EdgeInsets get mediumMargin => EdgeInsets.all(screenWidth * 0.04);
  static EdgeInsets get largeMargin => EdgeInsets.all(screenWidth * 0.06);
}