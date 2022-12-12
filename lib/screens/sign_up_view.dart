library sign_up__view;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunset_app/core/extensions/color_extension.dart';
import 'package:sunset_app/core/extensions/context_entension.dart';
import 'package:sunset_app/providers/signin_provider.dart';
import 'package:sunset_app/screens/main_page.dart';
import 'package:sunset_app/utils/locale_keys.dart';
import 'package:sunset_app/utils/navigate.dart';
import 'package:sunset_app/widgets/alread_account.dart';
import 'package:sunset_app/widgets/custom_button.dart';
import '../../../widgets/custom_appbar.dart';
import 'sign_up_mail_view.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  handleAfterSignIn() {
    setState(() {
      Future.delayed(const Duration(milliseconds: 1000)).then((f) {
        nextScreenCloseOthers(context, const HomePage());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: context.colors.backgroundSecondary,
      appBar: CustomAppbar(
        backgroundColor: context.colors.backgroundSecondary,
        title: LocaleKeys.register,
      ),
      body: Padding(
        padding: context.paddingMedium.copyWith(bottom: 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Mail Signup
                CustomButton(
                  textColor: context.colors.buttonPrimaryText,
                  backgroundColor: context.colors.buttonPrimary,
                  text: LocaleKeys.register_with_email,
                  icon: Icon(
                    Icons.email_outlined,
                    color: context.colors.whiteColor,
                  ),
                  onTap: () {
                    nextScreen(context, SignupMailPage());
                  },
                ),
                context.emptyLowMediumWidget,
                const AlreadyAccount(),
                context.emptyMediumWidget,


              ],
            ),
          ),
        ),
      ),
    );
  }
}
