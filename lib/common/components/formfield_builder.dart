import 'package:flutter/material.dart';

class FormFieldType extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Function? onChanged;
  final IconData suffixIcon;
  final Function()? onSuffixIconTap;
  final String? Function(String?)? validator;

  const FormFieldType(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.controller,
      required this.obscureText,
      this.validator,
      required this.onChanged,
      required this.suffixIcon,
      required this.onSuffixIconTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 2, bottom: 2),
      child: TextFormField(
        
        obscureText: obscureText,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon:
              GestureDetector(onTap: onSuffixIconTap, child: Icon(suffixIcon)),
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
