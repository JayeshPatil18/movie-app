import 'package:flutter/material.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/constants/textstyle.dart';
import '../widgets/button.dart';

class ViewDetails extends StatefulWidget {
  const ViewDetails({super.key});

  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  String selectedCurrency1 = 'VIBLE';
  String selectedCurrency2 = 'Uniswap';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}