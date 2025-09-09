import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final bool IsPassword;
  const MyTextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.IsPassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(labelText)),
      controller: textEditingController,
      obscureText: IsPassword,
    );
  }
}
