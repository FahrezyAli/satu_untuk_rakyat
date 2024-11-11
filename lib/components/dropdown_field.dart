import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/utils/colors.dart';

class SuratDropdownField extends StatelessWidget {
  final String? value;
  final String? hintText;
  final List<DropdownMenuItem<String>>? items;
  final bool enabled;
  final void Function(String?)? onChanged;

  const SuratDropdownField({
    super.key,
    this.value,
    this.hintText,
    this.items,
    this.enabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField(
        value: value,
        iconEnabledColor: suratBlue,
        items: items,
        onChanged: enabled ? onChanged : null,
        decoration: InputDecoration(
          hintText: null,
          isCollapsed: true,
        ),
        style: TextStyle(
          color: Colors.black,
          fontFamily: "Rubik",
          fontSize: 14,
        ),
        hint: Center(
          child: Text(
            hintText ?? "",
            style: TextStyle(
              color: Colors.grey,
              fontFamily: "Rubik",
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
