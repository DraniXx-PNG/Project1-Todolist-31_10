import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExmpWidescreen extends StatelessWidget {
  const ExmpWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("widescreem")),
      body: Center(child: Text("This is widescreen Layout")),
    );
  }
}