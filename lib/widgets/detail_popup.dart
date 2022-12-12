import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunset_app/core/extensions/color_extension.dart';
import 'package:sunset_app/core/extensions/context_entension.dart';
import 'package:sunset_app/providers/signin_provider.dart';
import 'package:sunset_app/services/app_services.dart';
import 'package:sunset_app/utils/locale_keys.dart';
import 'package:sunset_app/utils/navigate.dart';
import 'package:sunset_app/utils/toast.dart';
import 'package:sunset_app/widgets/custom_textfield.dart';




detailPopup(BuildContext context, double? lat, double? long, String? sunRise,
    String? sunSet, String? locName) {
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
                  height: context.height * 0.1,
                  child: Image.asset(
                    'assets/sun.png',
                    fit: BoxFit.fitHeight,
                    color: context.colors.lightOrangeColor,
                  )),
              context.emptyMediumHighWidget,
              // Text(LocaleKeys.location + "lat: " + lat.toString() + "long: " +  long.toString()),
              Text(locName.toString()),
              context.emptyLowWidget,
              Row(
                children: const [
                  Expanded(
                      child:
                      Text(LocaleKeys.hint, textAlign: TextAlign.center)),
                ],
              ),
              context.emptyMediumWidget,
              Text(LocaleKeys.sunrise + sunRise.toString()),
              Text(LocaleKeys.sunset + sunSet.toString()),
              context.emptyHighWidget,

            ],
          ),
          titlePadding: const EdgeInsets.all(0),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: context.width * 0.35, child: closeButton),
              ],
            )
          ],
        );
      });
}



