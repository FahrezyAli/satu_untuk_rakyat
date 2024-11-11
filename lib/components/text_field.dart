import 'package:flutter/material.dart';

class SuratTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool readOnly;
  final bool enabled;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;

  const SuratTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.readOnly = false,
      this.enabled = false,
      this.suffixIcon,
      this.suffixIconConstraints});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        cursorHeight: 15,
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          suffixIconConstraints: suffixIconConstraints,
          enabled: enabled,
        ),
        style: TextStyle(
          fontFamily: "Rubik",
          fontSize: 14,
        ),
      ),
    );
  }
}
