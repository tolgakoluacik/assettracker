import 'package:asset_tracker/constants/app_edge_insets.dart';
import 'package:asset_tracker/constants/app_radius.dart';
import 'package:asset_tracker/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.controller,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveAppEdgeInsets.smallPadding,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          color: Colors.deepPurple,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.deepPurple,
          ),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: AppSizes.small),
            borderRadius: BorderRadius.all(AppRadius.medium),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: AppSizes.small),
            borderRadius: BorderRadius.all(AppRadius.medium),
          ),
        ),
        validator: validator,
      ),
    );
  }
}