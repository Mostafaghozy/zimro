import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final double? radius;

  final String? errorText;

  const PasswordField({
    super.key,
    required this.label,
    this.controller,
    this.hintText,
    this.onChanged,
    this.validator,
    this.radius,

    this.errorText,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[600]!),
        borderRadius: BorderRadius.circular(widget.radius ?? 8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
          IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              size: 18,
              color: Colors.grey[600],
            ),
            onPressed: _toggleObscure,
          ),

          SizedBox(
            height: 15,
            child: TextFormField(
              controller: widget.controller,
              obscureText: _obscureText,
              keyboardType: TextInputType.visiblePassword,
              onChanged: widget.onChanged,
              validator: widget.validator,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 10),
                errorText: widget.errorText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
