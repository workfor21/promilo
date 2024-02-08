import 'package:flutter/material.dart';
import 'package:sizable/sizable.dart';

customTextFieldWidget({
  required TextEditingController controller,
  String? label,
  EdgeInsets? padding,
  Widget? suffixIcon,
  Widget? prefixIcon,
  bool obscureText = false,
  Function(String?)? validator,
  Function(String)? onChanged,
}) {
  return Padding(
    padding: padding ?? spacingSym(v: 5, h: 0),
    child: TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label ?? "label"),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: spacing(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
          ),
        ),
      ),
      onChanged: onChanged == null ? null : (value) => onChanged(value),
      validator: validator == null ? null : (value) => validator(value),
    ),
  );
}
