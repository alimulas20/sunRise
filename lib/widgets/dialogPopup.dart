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

String locName = "";

void add(setState, String val) {
  setState(() {
    locName = val;
  });
}

infoDialog(BuildContext context, double lat, double long, String sunRise,
    String sunSet) {
  final SignInProvider sp = Provider.of<SignInProvider>(context, listen: false);

  Map<String, dynamic> data = {
    "sunrise": sunRise,
    "sunset": sunSet,
    "latitude": lat,
    "longitude": long,
    "name": locName
  };
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
  Widget saveButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.whiteColor,
        shape: RoundedRectangleBorder(
            borderRadius: context.containerBorderRadiusLow,
            side: BorderSide(width: 1, color: context.colors.orangeColor)),
        minimumSize: Size(context.width * 0.8, context.height * 0.06)),
    child: Text(
      LocaleKeys.save,
      style: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: context.colors.orangeColor),
    ),
    onPressed: () {
      saveLocation(sp.uid, locName, data).then((value) {
        backScreen(context);
        openToastShort(context, LocaleKeys.location_saved);
      });
    },
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return AlertDialog(
              insetPadding:
                  EdgeInsets.symmetric(horizontal: context.width * 0.05),
              backgroundColor: context.colors.backgroundSecondary,
              shape: RoundedRectangleBorder(
                  borderRadius: context.containerBorderRadiusLow,
                  side:
                      BorderSide(width: 1, color: context.colors.grayTwoColor)),
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
                  Row(
                    children: const [
                      Expanded(
                          child: Text(LocaleKeys.hint,
                              textAlign: TextAlign.center)),
                    ],
                  ),
                  context.emptyMediumWidget,
                  Text(LocaleKeys.sunrise + sunRise),
                  Text(LocaleKeys.sunset + sunSet),
                  context.emptyHighWidget,
                  CustomTextfield(
                    keyboardType: TextInputType.text,
                    autoFocus: false,
                    onChanged: (value) {
                      add(setState, value);
                    },
                  )
                ],
              ),
              titlePadding: const EdgeInsets.all(0),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: context.width * 0.35, child: closeButton),
                    SizedBox(width: context.width * 0.35, child: saveButton),
                  ],
                )
              ],
            );
          },
        );
      });
}

// class InfoDialog extends StatefulWidget {
//   const InfoDialog({
//     required this.lat,
//     required this.long,
//     required this.sunRise,
//     required this.sunSet,
//     Key? key}) : super(key: key);
//
//  final double lat;
//  final double long;
//  final String sunRise;
//  final String sunSet;
//
//   @override
//   State<InfoDialog> createState() => _InfoDialogState();
// }
//
// class _InfoDialogState extends State<InfoDialog> {
//   @override
//   Widget build(BuildContext context) {
//     final SignInProvider sp =
//     Provider.of<SignInProvider>(context, listen: false);
//     String? locName;
//     Map<String, dynamic> data = {
//       "sunrise": widgt.sunRise,
//       "sunset": sunSet,
//       "latitude": lat,
//       "longitude": long,
//       "name" : locName
//     };
//     Widget closeButton = ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//               borderRadius: context.containerBorderRadiusLow,
//               side: BorderSide(width: 1, color: context.colors.orangeColor)),
//           minimumSize: Size(context.width * 0.8, context.height * 0.06)),
//       child: const Text(
//         LocaleKeys.okey,
//         style: TextStyle(
//           fontFamily: 'Rubik',
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       onPressed: () {
//         Navigator.of(context, rootNavigator: true).pop(context);
//       },
//     );
//     Widget saveButton = ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           backgroundColor: context.colors.whiteColor,
//           shape: RoundedRectangleBorder(
//               borderRadius: context.containerBorderRadiusLow,
//               side: BorderSide(width: 1, color: context.colors.orangeColor)),
//           minimumSize: Size(context.width * 0.8, context.height * 0.06)),
//       child: Text(
//         LocaleKeys.save,
//         style: TextStyle(
//             fontFamily: 'Rubik',
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: context.colors.orangeColor),
//       ),
//       onPressed: () {
//         saveLocation(sp.uid, locName!, data).then((value) {
//           backScreen(context);
//           openToastShort(context, LocaleKeys.location_saved);
//         });
//       },
//     );
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             insetPadding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
//             backgroundColor: context.colors.backgroundSecondary,
//             shape: RoundedRectangleBorder(
//                 borderRadius: context.containerBorderRadiusLow,
//                 side: BorderSide(width: 1, color: context.colors.grayTwoColor)),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                     height: context.height * 0.1,
//                     child: Image.asset(
//                       'assets/sun.png',
//                       fit: BoxFit.fitHeight,
//                       color: context.colors.lightOrangeColor,
//                     )),
//                 context.emptyMediumHighWidget,
//                 // Text(LocaleKeys.location + "lat: " + lat.toString() + "long: " +  long.toString()),
//                 Row(
//                   children: const [
//                     Expanded(
//                         child:
//                         Text(LocaleKeys.hint, textAlign: TextAlign.center)),
//                   ],
//                 ),
//                 context.emptyMediumWidget,
//                 Text(LocaleKeys.sunrise + sunRise),
//                 Text(LocaleKeys.sunset + sunSet),
//                 context.emptyHighWidget,
//                 CustomTextfield(
//                   keyboardType: TextInputType.text,
//                   autoFocus: false,
//                   onChanged: (value) {
//
//                     locName = value;
//                   },
//                 )
//               ],
//             ),
//             titlePadding: const EdgeInsets.all(0),
//             actions: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   SizedBox(width: context.width * 0.35, child: closeButton),
//                   SizedBox(width: context.width * 0.35, child: saveButton),
//                 ],
//               )
//             ],
//           );
//         });
//   }
//   }


