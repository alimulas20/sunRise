// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sunset_app/core/extensions/context_entension.dart';

import '../utils/navigate.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({
    Key? key,
    required this.title,
    this.centerTitle = false,
    this.onTap,
    this.color,
    this.backgroundColor,
    this.backButton = true,
    this.subText,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;

  String title;
  bool centerTitle;
  bool backButton;
  Color? backgroundColor;
  VoidCallback? onTap;
  Color? color;
  String? subText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // elevation: 1,
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      toolbarHeight: kToolbarHeight,
      leading: backButton
          ? Row(
        children: [
          context.emptyMediumWidgetW,
          GestureDetector(
            onTap: onTap ??
                    () {
                  backScreen(context);
                },
            child: Icon(
              Icons.arrow_back_sharp,
              color: color,
            ),
          ),
        ],
      )
          : null,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: color),
      ),
    );
  }
}
