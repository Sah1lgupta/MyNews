import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  final String text ;
  final Color color;

  const CustomFont({super.key, required this.text,  required this.color});

  @override
  Widget build(BuildContext context) {
    return Text('${text}',style: TextStyle(fontFamily: 'Poppins',color: color),);
  }
}
