import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  Function(String)? onChanged;
  bool obscureText;
  CustomTextField({this.onChanged,required this.hintText,this.obscureText=false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'this field is required';
        }
      },
      onChanged: onChanged,
      
      decoration: InputDecoration(
      
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        
      ),
    );
  }
}