import 'package:flutter/material.dart';

class MobileWaitScrent extends StatelessWidget {
  const MobileWaitScrent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("widescreen Example"),
      ),
      body: Center(
        child: Text("This is widescreen Layout"),
      ),
    );
  }
}