import 'package:asset_tracker/constants/app_edge_insets.dart';
import 'package:flutter/material.dart';

class CustomButtonField extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButtonField({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(buttonText),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepPurple,
          padding: ResponsiveAppEdgeInsets.mediumPadding
        ),
      );
  }
}
