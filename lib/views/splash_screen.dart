import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  void _startSplashScreen() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.monitor_heart_outlined, size: 100, color: Colors.deepPurple),
            const SizedBox(height: 20),
            Text("appName".tr(),
              style: const TextStyle(color: Colors.deepPurple,
              fontSize: 26,
              fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
