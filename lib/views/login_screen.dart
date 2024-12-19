import 'package:asset_tracker/widgets/custom_button.dart';
import 'package:asset_tracker/widgets/email_text_field.dart';
import 'package:asset_tracker/widgets/password_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'home.dart';

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
      backgroundColor: Colors.amber,
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
                  CustomButtonField(
                    buttonText: 'login'.tr(),
                    icon: Icons.login,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                      final email = emailController.text;

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            email: email,
                          ),
                        ),
                      );
                    };
                  },
                  ),
                  CustomButtonField(
                    buttonText: 'register'.tr(),
                    icon: Icons.login,
                    onPressed: () {},
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
