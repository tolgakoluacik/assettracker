import 'package:asset_tracker/widgets/custom_button.dart';
import 'package:asset_tracker/widgets/custom_text_field.dart';
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
              labelText: 'Email',
              controller: emailController,
            ),
            const CustomTextField(
              labelText: 'Password',
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonField(
                  buttonText: 'Login',
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
                  buttonText: 'Register',
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
