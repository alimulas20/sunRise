import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sunset_app/core/extensions/color_extension.dart';
import 'package:sunset_app/core/extensions/context_entension.dart';
import 'package:sunset_app/screens/login_signup_view.dart';
import 'package:sunset_app/utils/locale_keys.dart';
import '../utils/navigate.dart';


class AlreadyAccount extends StatelessWidget {
  const AlreadyAccount({
    Key? key,
  }) : super(key: key);

  navigateToPage(context) {
    nextScreenReplace(context, const LoginSignupPage());
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: LocaleKeys.already_have_an_account + " ",
      style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 16,
        color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(.8),
        fontWeight: FontWeight.w400,
      ),
      children: [
        TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () => navigateToPage(context),
          text: LocaleKeys.login,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 16,
            color: context.colors.buttonPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ));
  }
}
