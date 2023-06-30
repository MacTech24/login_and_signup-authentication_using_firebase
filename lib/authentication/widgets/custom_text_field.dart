// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.uniqueKey,
    this.validator,
    this.onSaved,
    this.controller,
  }) : super(key: key);

  final String hintText;
  final String uniqueKey;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      key: ValueKey(uniqueKey),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
            width: 3,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
            width: 3,
            style: BorderStyle.solid,
          ),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
