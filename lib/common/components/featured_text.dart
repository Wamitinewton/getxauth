import 'package:flutter/material.dart';

class FeaturedText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final Color textColor;

  const FeaturedText({
    super.key,
    required this.text,
    required this.onTap,
    required this.fontSize,
    required this.fontWeight,
    required this.fontStyle,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34),
      child: InkWell(
        splashColor: Colors.grey,
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontStyle: fontStyle,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}


