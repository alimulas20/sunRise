// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class FieldTitleWidget extends StatelessWidget {
  FieldTitleWidget({
    Key? key,
    required this.title,
    this.isBold = false,
  }) : super(key: key);
  final String title;
  bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(

      title,
      style: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 14,
          fontWeight: isBold ? FontWeight.w500 : FontWeight.w400,
          color: Theme.of(context).textTheme.headline6!.color),
      // textAlign: TextAlign.start,
    );
  }
}
