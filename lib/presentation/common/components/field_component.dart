// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palli_application/core/themes/color_themes.dart';

class FieldComponent extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? hintText;
  final String? labelText;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final TextInputType? type;
  final bool autofocus;
  final bool readOnly;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  const FieldComponent({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.suffix,
    this.validator,
    this.onTap,
    this.type,
    this.autofocus = false,
    this.readOnly = false,
    this.enabled,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 48.0),
      child: TextFormField(
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        readOnly: readOnly,
        autofocus: autofocus,
        enabled: enabled,
        controller: controller,
        keyboardType: type,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          // Customize the border here
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: darkGreenColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: darkGreenColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: darkGreenColor,
            ),
          ),
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
