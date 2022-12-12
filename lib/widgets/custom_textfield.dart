// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sunset_app/core/extensions/color_extension.dart';
import 'package:sunset_app/core/extensions/context_entension.dart';
import 'package:sunset_app/utils/locale_keys.dart';

class CustomTextfield extends StatefulWidget {

  CustomTextfield({
    Key? key,
    this.hintText,
    this.isPassword = false,
    this.isHelper = false,
    this.icon,
    this.hintColor,
    this.controller,
    this.onSubmitted,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.border = false,
    this.backgroundColor = false,
    this.textAlign = false,
    this.readOnly = false,
    required this.keyboardType,
    this.minLines,
    this.maxLines,
    this.suffixIcon,
    this.focusNode,
    required this.autoFocus
  }) : super(key: key);

  final TextEditingController? controller;
  String? hintText;
  bool isPassword;
  bool isHelper;
  bool border;
  bool backgroundColor;
  bool textAlign;
  bool readOnly;
  Widget? icon;
  Color? hintColor;
  final ValueChanged? onSubmitted;
  final VoidCallback? onEditingComplete;
  final ValueChanged? onChanged;
  final VoidCallback? onTap;
  TextInputType keyboardType;
  int? minLines;
  int? maxLines;
  Widget? suffixIcon;
  FocusNode? focusNode;
  bool autoFocus;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool isVisible;
  @override
  void initState() {
    isVisible = widget.isPassword ? false : true; // false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.autoFocus,
      focusNode: widget.focusNode,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines ?? 1,
      keyboardType: widget.keyboardType,
      readOnly: widget.readOnly,
      textAlign: widget.textAlign ? TextAlign.center : TextAlign.start,
      controller: widget.controller,
      cursorColor: context.colors.orangeColor,
      obscureText: !isVisible,
      onSubmitted: widget.onSubmitted,
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: widget.hintColor),
        helperText:
            widget.isHelper ? LocaleKeys.password_error_text : null,
        helperStyle: const TextStyle(
          fontSize: 14,
          fontFamily: 'Rubik',
        ),

        fillColor: widget.backgroundColor
            ? context.colors.grayFiveColor
            : Theme.of(context).dialogBackgroundColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: context.colors.whiteColor,
            style: BorderStyle.solid,
            width: 5,
          ),
        ),
        suffixIcon: widget.suffixIcon,

        //imlecin ortalanması için
        contentPadding: widget.icon != null
            ? context.paddingLowMedium
            : EdgeInsets.only(
                left: context.mediumValue,
                // top: context.lowMediumValue,
              ),
        prefixIcon: widget.icon != null
            ? Padding(
                padding:
                    context.paddingLowMedium.copyWith(right: context.lowValue),
                child: widget.icon,
              )
            : null,
        labelStyle: TextStyle(
          color: context.colors.orangeColor,
          fontFamily: 'Rubik',
        ),
        floatingLabelStyle: TextStyle(
          color: context.colors.orangeColor,
        ),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        errorBorder: buildBorder(),
        disabledBorder: buildBorder(),
        focusedErrorBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
          color:
              widget.border ? context.colors.orangeColor : Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
