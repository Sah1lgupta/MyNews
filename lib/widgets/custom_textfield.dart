import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController ;
  final String label;
  final String hint;
  final bool obscureText;

  const MyTextFieldWidget({super.key, required this.textEditingController, required this.label, required this.hint, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontFamily: 'Poppins'),
      obscureText: obscureText,
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: '${label}',
            hintText: '${hint}',
         //   prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        );
  }
}
