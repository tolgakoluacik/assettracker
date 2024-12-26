import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../constants/app_edge_insets.dart';
import '../views/home.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed:  () {
      if (formKey.currentState?.validate() ?? false) {
        final email = emailController.text;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              email: email,
            ),
          ),
        );
      }
    },
      icon: const Icon(Icons.login),
      label: Text('login'.tr()),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        padding: ResponsiveAppEdgeInsets.mediumPadding,
      ),
    );
  }
}
