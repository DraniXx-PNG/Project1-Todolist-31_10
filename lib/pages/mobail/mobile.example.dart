import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MobileExample extends StatelessWidget {
  const MobileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Mobile Example"),
      ),
      body: Center(
        child: Text("This is Mobile Layout"),
      ),
    );
  }
}