import 'package:chada_buzz/pages/chada_buzz_app.dart';
import 'package:flutter/material.dart';

Widget customTextField(
  final TextEditingController controller,
  final String hintText,
  final IconData icon,
) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: TextFormField(
    keyboardType: TextInputType.number,
    controller: controller,
    decoration: InputDecoration(
      filled: true,
      fillColor: primaryColor.withOpacity(0.1),
      prefixIcon: Icon(icon, size: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 0.5, color: Colors.black),
      ),
      enabled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 0.5, color: Colors.black),
      ),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'sf'),
    ),
  ),
);
