import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String balanceText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;

  CustomTextField({
    required this.hintText,
    required this.balanceText,
    required this.onChanged,
    this.validator,
    Key? key,
  })  : controller = TextEditingController(),
        super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.blue),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        SizedBox(height: 8),
        Text(widget.balanceText, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}