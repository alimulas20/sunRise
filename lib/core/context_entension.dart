import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  double get veryLowValue => 4;

  double get lowValue => 8;

  double get lowMediumValue => 16;

  double get mediumValue => 24;

  double get mediumHighValue => 32;

  double get veryHighValue => 60;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  TextTheme get splashTextTheme => theme.textTheme;

  ColorScheme get colors => theme.colorScheme;
}

extension TextExtension on BuildContext {
  TextStyle get splashTitleText => const TextStyle(
      fontFamily: 'Rubik',
      fontSize: 14,
      color: Colors.white
  );
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingVeryLow =>
      EdgeInsets.symmetric(horizontal: veryLowValue, vertical: veryLowValue);

  EdgeInsets get paddingLow =>
      EdgeInsets.symmetric(horizontal: lowValue, vertical: lowValue);

  EdgeInsets get paddingLowMedium => EdgeInsets.all(lowMediumValue);

  EdgeInsets get paddingMedium =>
      EdgeInsets.symmetric(horizontal: mediumValue, vertical: mediumValue);
}

extension PaddingExtensionSymetric on BuildContext {
  ///vertical:

  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);

  EdgeInsets get paddingLowMediumVertical =>
      EdgeInsets.symmetric(vertical: lowMediumValue);

  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);

  ///Horizontol:

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);

  EdgeInsets get paddingLowMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: lowMediumValue);

  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingMediumHighHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumHighValue);
  EdgeInsets get paddingMediumHigh => EdgeInsets.all(mediumHighValue);
  EdgeInsets get paddingVeryHighHorizontal =>
      EdgeInsets.symmetric(horizontal: veryHighValue);
}

extension BoxDecorationExtension on BuildContext {
  double get radiusLow => 8;

  double get radiusMedium => 20;

  BorderRadius get containerBorderRadiusLow => BorderRadius.circular(radiusLow);

  BorderRadius get containerBorderRadiusMedium =>
      BorderRadius.circular(radiusMedium);

  RoundedRectangleBorder get lowCircularBorder =>
      RoundedRectangleBorder(borderRadius: containerBorderRadiusLow);

  RoundedRectangleBorder get normalCircularBorder =>
      RoundedRectangleBorder(borderRadius: containerBorderRadiusMedium);

  List<BoxShadow> get customBoxShadowGrey => [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      blurRadius: 4,
      offset: const Offset(0, 4),
    ),
  ];

  // List<BoxShadow> get customBoxShadowBlue => [
  //       BoxShadow(
  //         color: const Color(0xFF2a3747).withOpacity(0.20),
  //         blurRadius: 12,
  //         spreadRadius: 0,
  //         offset: const Offset(0, 4), // changes position of shadow
  //       ),
  //     ];

  Radius get circularRadiusLow => Radius.circular(radiusLow);

  Radius get circularRadiusMedium => Radius.circular(radiusMedium);
}

extension EmptyWidget on BuildContext {
  Widget get emptyZeroWidget => const SizedBox(height: 0);

  Widget get emptyLowWidget => SizedBox(height: lowValue);

  Widget get emptyLowMediumWidget => SizedBox(height: lowMediumValue);

  Widget get emptyMediumWidget => SizedBox(height: mediumValue);

  Widget get emptyVeryLowWidget => SizedBox(height: veryLowValue);

  Widget get emptyVeryLowWidgetW => SizedBox(width: veryLowValue);

  Widget get emptyLowWidgetW => SizedBox(width: lowValue);

  Widget get emptyLowMediumWidgetW => SizedBox(width: lowMediumValue);

  Widget get emptyMediumWidgetW => SizedBox(width: mediumValue);

  Widget get emptyMediumHighWidget => SizedBox(height: mediumHighValue);

  Widget get emptyMediumHighWidgetW => SizedBox(width: mediumHighValue);

  Widget get emptyHighWidget => SizedBox(height: veryHighValue);

  Widget get emptyHighWidgetW => SizedBox(width: veryHighValue);
}
