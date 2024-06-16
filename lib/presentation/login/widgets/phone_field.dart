import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class AuthPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String initialCountryCode;
 final FutureOr<String?> Function(PhoneNumber?)? validator;

  const AuthPhoneField({
    super.key,
    required this.controller,
    required this.labelText,
    this.initialCountryCode = 'IN',
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: const Icon(Icons.phone,color: Colors.red,)
      ),
      disableLengthCheck: true,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      initialCountryCode: initialCountryCode,
      dropdownIconPosition: IconPosition.trailing,
      showCountryFlag: true,
      validator: validator,
    );
  }
}