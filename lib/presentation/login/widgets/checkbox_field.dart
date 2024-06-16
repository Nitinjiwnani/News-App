
import 'package:flutter/material.dart';

class AuthCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const AuthCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'I agree with '),
              TextSpan(
                text: 'terms & conditions',
                style: TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ],
    );
  }
}