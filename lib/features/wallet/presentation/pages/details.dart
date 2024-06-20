import 'package:flutter/material.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/constants/textstyle.dart';
import '../../domain/entities/entite.dart';
import '../widgets/button.dart';

class ViewDetails extends StatefulWidget {
  final Movie movie;

  const ViewDetails({super.key, required this.movie});

  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}