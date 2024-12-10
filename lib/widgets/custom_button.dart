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
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
          alignment: Alignment.center,
          padding: MaterialStatePropertyAll(
            EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 15),
          ),
          maximumSize: MaterialStatePropertyAll(Size.fromWidth(140)),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              buttonText,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
