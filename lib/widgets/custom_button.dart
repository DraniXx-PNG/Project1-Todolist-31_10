import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.textColor, required this.onPressed});
  
  final String text;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      onPressed: onPressed, child: Text(text, style: TextStyle(color: textColor),),
     );
  }
}