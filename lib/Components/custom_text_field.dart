import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  Function(String)? onChanged;
  CustomTextField({this.onChanged,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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