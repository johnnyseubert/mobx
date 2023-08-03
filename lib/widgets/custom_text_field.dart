import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.hintText,
    this.prefix,
    this.suffix,
    this.obscureText = false,
  });

  final void Function(String)? onChanged;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: hintText,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
