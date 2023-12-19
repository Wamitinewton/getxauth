import 'package:flutter/material.dart';

class FormFieldType extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Function? onChanged;
  final String? Function(String?)? validator;

  const FormFieldType(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.controller,
      required this.obscureText,
      this.validator,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
