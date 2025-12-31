import 'package:flutter/material.dart';
import 'dart:ui';

class GlassButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const GlassButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.blueGrey.withOpacity(0.10)],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.transparent.withOpacity(0.0),
              width: 0.2,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,

              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
