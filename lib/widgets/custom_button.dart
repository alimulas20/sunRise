import 'package:flutter/material.dart';
import 'package:sunset_app/core/extensions/color_extension.dart';
import 'package:sunset_app/core/extensions/context_entension.dart';
import 'package:sunset_app/utils/locale_keys.dart';
import 'package:sunset_app/utils/navigate.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Color? backgroundColor;
  final VoidCallback onTap;
  final Color? textColor;
  final bool spacing;
  final bool border;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.spacing = true,
    this.border = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: context.paddingLowMedium,
        decoration: BoxDecoration(
          color: backgroundColor ?? context.colors.orangeColor,
          borderRadius: context.containerBorderRadiusMedium,
          border: border
              ? Border.all(width: 1, color: context.colors.orangeColor)
              : null,
        ),
        child: Padding(
          padding: context.paddingLowMedium,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    icon!,
                    if (spacing) context.emptyLowMediumWidgetW,
                  ],
                ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 16,
                  color: textColor ??
                      (Theme
                          .of(context)
                          .brightness == Brightness.dark
                          ? Theme
                          .of(context)
                          .textTheme
                          .headline6!
                          .color
                          : context.colors.whiteColor),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


