import 'package:flutter/material.dart';
import 'package:sunset_app/core/extensions/color_extension.dart';
import 'package:sunset_app/core/extensions/context_entension.dart';
import 'package:sunset_app/utils/locale_keys.dart';

errorAlert(BuildContext context, errorMessage) {
  Widget closeButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: context.containerBorderRadiusLow,
            side: BorderSide(width: 1, color: context.colors.orangeColor)),
        minimumSize: Size(context.width * 0.8, context.height * 0.06)),
    child: const Text(
      LocaleKeys.okey,
      style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop(context);
    },
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
          backgroundColor: context.colors.backgroundSecondary,
          shape: RoundedRectangleBorder(
              borderRadius: context.containerBorderRadiusLow,
              side: BorderSide(width: 1, color: context.colors.grayTwoColor)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: context.height*0.1,
                  child: Image.asset('assets/cross.png', fit: BoxFit.fitHeight,)),
              context.emptyMediumHighWidget,
              Text(
                errorMessage ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 16,
                  color: context.colors.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          titlePadding: const EdgeInsets.all(0),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: context.width*0.5,
                    child: closeButton),
              ],
            )
          ],
        );
      });
}