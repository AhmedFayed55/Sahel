import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool filled;

  const CustomPasswordField({
    super.key,
    required this.hintText,
    required this.controller,
    this.filled = false, // switch between outlined and filled style
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: GestureDetector(
          onTap: _toggleVisibility,
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
        filled: widget.filled,
        fillColor: widget.filled ? Colors.grey.shade200 : null,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 16.0,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: widget.filled
              ? BorderSide.none
              : BorderSide(color: Colors.grey.shade400),
        ),
      ),
    );
  }
}
