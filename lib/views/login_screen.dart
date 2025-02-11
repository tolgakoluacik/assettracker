import 'package:asset_tracker/services/auth_service.dart';
import 'package:asset_tracker/widgets/custom_button.dart';
import 'package:asset_tracker/widgets/email_text_field.dart';
import 'package:asset_tracker/widgets/empty_size.dart';
import 'package:asset_tracker/widgets/password_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailTextField(
                controller: emailController,
              ),
              PasswordTextField(
                controller: passwordController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginButton(
                    formKey: _formKey,
                    emailController: emailController,
                      passwordController: passwordController,
                  ),
                  EmptySize.small,
                  CustomButtonField(
                    buttonText: 'register'.tr(),
                    icon: Icons.app_registration,
                    onPressed: () {
                        AuthService.authService.registerWithEmailAndPassword(emailController.text, passwordController.text);
                      },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
