import 'package:flutter/material.dart';


isLight(brightness) {
  return brightness == Brightness.light;
}
extension CustomColorScheme on ColorScheme {
  //?--Background
  Color get backgroundPrimary =>
      isLight(brightness) ? primaryColor : Colors.black12;
  Color? get backgroundSecondary =>
      isLight(brightness) ? grayFiveColor : Colors.black26;
  Color? get backgroundDialog =>
      isLight(brightness) ? whiteColor : Colors.black38;
  Color? get backgroundDialogTest =>
      isLight(brightness) ? lightOrangeColor : grayOneColor;
  Color? get backgroundSearchTile =>
      isLight(brightness) ? grayFiveColor : Colors.grey;
  Color? get backgroundProfile =>
      isLight(brightness) ? whiteColor : Colors.white.withOpacity(.4);

  //?--Button
  Color? get buttonPrimary =>
      isLight(brightness) ? orangeColor : Colors.blueGrey;
  Color? get buttonPrimaryText => isLight(brightness) ? whiteColor : whiteColor;
  Color? get buttonSecondary =>
      isLight(brightness) ? grayFourColor : Colors.grey;
  Color? get buttonSecondaryText =>
      isLight(brightness) ? orangeColor : whiteColor;

  Color? get buttonSelectJob => isLight(brightness) ? whiteColor : Colors.grey;
  Color? get buttonSelectJobText =>
      isLight(brightness) ? orangeColor : whiteColor;

  //?--Text Field
  Color? get textFieldBorder => isLight(brightness) ? orangeColor : whiteColor;
  Color? get textTitleWhite => whiteColor;
  Color? get textTitle => isLight(brightness) ? whiteColor : Colors.black87;

  ///
  Color get onboardingBackground => orangeColor;
  Color get splashTitleColor => grayTwoColor;
  Color get onboardingButtonColor => whiteColor;

  Color get facebookColor => const Color(0xFF0056B2);
  Color get fieldTitleColor => const Color(0xFF0c092a);

  //Color Styles -- Light
  Color get primaryColor => const Color(0xFFEFEEFC);
  Color get secondaryColor => const Color(0xFFE6E6E6);
  Color get orangeColor => const Color(0xFFEF9500);
  Color get softOrangeColor => const Color.fromRGBO(239, 149, 0, 0.5);
  Color get lightOrangeColor => const Color(0xFFFAB74A);
  Color get pinkSalmonColor => const Color(0xFFFF8FA2);
  Color get softPinkSalmonColor => const Color.fromRGBO(255, 143, 162, 0.5);
  Color get pastelPinkColor => const Color(0xFFFFD6DD);
  Color get hawkesBlueColor => const Color(0xFFC4D0FB);
  Color get mintTulipColor => const Color.fromARGB(255, 38, 53, 50);
  Color get blackColor => const Color(0xFF0C092A);
  Color get softBlackColor => const Color.fromRGBO(12, 9, 42, 0.5);
  Color get grayOneColor => const Color(0xFF49465F);
  Color get grayTwoColor => const Color(0xFF858494);
  Color get softGrayTwoColor => const Color.fromRGBO(133, 132, 148, 0.5);
  Color get grayThreeColor => const Color(0xFF858494);
  Color get grayFourColor => const Color(0xFFE6E6E6);
  Color get grayFiveColor => const Color(0xFFEFEEFC);
  Color get whiteColor => const Color(0xFFFFFFFF);
  Color get lightPinkColor => const Color(0xFFFFD6DD);
  Color get blueColor => const Color(0xFF1CB0CA);
  Color get softBlueColor => const Color.fromRGBO(28, 176, 202, 0.5);
  Color get greenColor => const Color(0xFF2eca8c);
  Color get softGreenColor => const Color.fromRGBO(46, 202, 140, 0.5);
  Color get redColor => const Color(0xFFFF0000);
  Color get softRedColor => const Color.fromRGBO(255, 0, 0, 0.5);
  Color get pastelGreenColor => const Color(0xFFE6F9F1);
  Color get pastelOrangeColor => const Color(0xFFFEF2E3);
  Color get pastelGrayColor => const Color(0xFFF8F9FA);
}