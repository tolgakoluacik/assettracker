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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.deepPurple,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(buttonText,),
          ],
        ),
      ),
    );
  }
}
