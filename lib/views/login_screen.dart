import 'package:asset_tracker/widgets/custom_button.dart';
import 'package:asset_tracker/widgets/custom_text_field.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              labelText: 'email'.tr(),
              controller: emailController,
            ),
            CustomTextField(
              labelText: 'password'.tr(),
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonField(
                  buttonText: 'login'.tr(),
                  icon: Icons.login,
                  onPressed: () {
                    final email = emailController.text;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          email: email,
                        ),
                      ),
                    );
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
    );
  }
}
