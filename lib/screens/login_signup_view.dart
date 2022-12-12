import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunset_app/core/extensions/color_extension.dart';
import 'package:sunset_app/core/extensions/context_entension.dart';
import 'package:sunset_app/providers/signin_provider.dart';
import 'package:sunset_app/screens/sign_up_view.dart';
import 'package:sunset_app/screens/signin_page.dart';
import 'package:sunset_app/utils/locale_keys.dart';
import '../utils/navigate.dart';

import '../widgets/custom_button.dart';


class LoginSignupPage extends StatelessWidget {
  const LoginSignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInProvider sp = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: Container(
        decoration: buildDecoration(context),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Padding(
                  padding: context.paddingMedium,
                  child: ClipRRect(
                    borderRadius: context.containerBorderRadiusMedium,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: context.colors.backgroundDialog,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: context.lowMediumValue,
                            bottom: context.lowMediumValue,
                            top: context.lowMediumValue,
                            right: context.lowMediumValue),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  LocaleKeys.register_or_login,
                                  style: TextStyle(
                                    fontFamily: 'Rubik',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                context.emptyLowWidget,
                              ],
                            ),
                            context.emptyMediumWidget,
                            Column(
                              children: [
                                //Giriş Butonu
                                CustomButton(
                                  textColor: context.colors.buttonPrimaryText,
                                  backgroundColor: context.colors.buttonPrimary,
                                  text: LocaleKeys.login,
                                  onTap: () {
                                    navigateLoginPage(context);
                                  },
                                ),
                                context.emptyLowMediumWidget,
                                //Hesap Oluştur Butonu
                                CustomButton(
                                  text: LocaleKeys.create_account,
                                  textColor: context.colors.buttonSecondaryText,
                                  backgroundColor:
                                  context.colors.buttonSecondary,
                                  onTap: () {
                                    navigateSignUpPage(context);
                                  },
                                ),
                                //?Daha Sonra Butonu
                                // context.emptyLowWidget,
                                // CustomButton(
                                //   text: LocaleKeys.later.tr(),
                                //   onTap: () {
                                //     navigateLoginPage(context);
                                //   },
                                //   backgroundColor: Colors.transparent,
                                //   textColor: context.colors.grayTwoColor,
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  navigateLoginPage(context) {
    nextScreen(context, const LoginPage());
  }

  navigateSignUpPage(context) {
    nextScreen(context, SignUpPage());
  }

  BoxDecoration buildDecoration(BuildContext context) {
    return const BoxDecoration(

    );
  }
}
