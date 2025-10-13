import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final bool isPassword;

  const MyTextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    this.isPassword = false, 
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: isPassword? "Masukkan passowrd" : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
