import 'package:flutter/material.dart';

class GenreChip extends StatelessWidget {
  final String label;

  GenreChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[800],
      labelStyle: TextStyle(color: Colors.white),
    );
  }
}