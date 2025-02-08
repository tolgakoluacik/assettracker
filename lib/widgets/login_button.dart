import 'package:asset_tracker/constants/theme_colors.dart';
import 'package:asset_tracker/views/home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../constants/app_edge_insets.dart';
import '../services/auth_service.dart';
import '../services/mock_auth_service.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed:  () async {
      if (formKey.currentState?.validate() ?? false) {
        final email = emailController.text;
        final password = passwordController.text;

        try {
          final user = await AuthService.authService.signInWithEmailAndPassword(
            email,
            password,
          );

          if (user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen(email: user.email)),
            );
          }
        } catch (e) {
          if (e is AuthException) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.code.tr())),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('default-error'.tr())),
            );
          }
        }
      }
    },
      icon: const Icon(Icons.login, color: AppColors.mainButtonTextColor,),
      label: Text('login'.tr()),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainButtonBackground,
        foregroundColor: AppColors.mainButtonTextColor,
        padding: ResponsiveAppEdgeInsets.mediumPadding,
      ),
    );
  }
}
