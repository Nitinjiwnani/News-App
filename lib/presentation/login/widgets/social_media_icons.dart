import 'package:flutter/material.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/google.png',
          height: 35,
          width: 35,
        ),
        const SizedBox(width: 35),
        Image.asset(
          'assets/images/facebook.jpeg',
          height: 35,
          width: 35,
        ),
      ],
    );
  }
}