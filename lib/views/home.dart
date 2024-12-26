import 'package:asset_tracker/views/login_screen.dart';
import 'package:asset_tracker/widgets/custom_button.dart';
import 'package:asset_tracker/widgets/empty_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String email;

  const HomeScreen({
    required this.email,
    super.key,
  });

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late String email;
  late String password;

  @override
  void initState() {
    super.initState();
    email = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('hello').tr(namedArgs: {'name': email}),
            ],
          ),
          EmptySize.large,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonField(
                buttonText: 'logout'.tr(),
                icon: Icons.logout_outlined,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
