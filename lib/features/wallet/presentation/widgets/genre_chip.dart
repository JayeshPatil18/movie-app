import 'package:flutter/material.dart';

import '../../../../shared/constants/colors.dart';

class GenreChip extends StatelessWidget {
  final String label;

  GenreChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Chip(
          label: Text(label),
          backgroundColor: Colors.grey[800],
          labelStyle: TextStyle(color: text),
        ),
        SizedBox(width: 10)
      ],
    );
  }
}