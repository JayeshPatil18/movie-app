import 'package:flutter/material.dart';

import '../../../../shared/constants/textstyle.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String text;
  final double height;
  final TextStyle textStyle;
  final double borderRadius;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.backgroundColor,
    required this.text,
    this.height = 55.0,
    this.textStyle = buttonTextStyle,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
