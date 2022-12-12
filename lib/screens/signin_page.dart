import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sunset_app/core/extensions/color_extension.dart';
import 'package:sunset_app/core/extensions/context_entension.dart';
import 'package:sunset_app/providers/signin_provider.dart';
import 'package:sunset_app/screens/main_page.dart';
import 'package:sunset_app/services/app_services.dart';
import 'package:sunset_app/utils/locale_keys.dart';
import 'package:sunset_app/utils/navigate.dart';
import 'package:sunset_app/widgets/custom_appbar.dart';
import 'package:sunset_app/widgets/custom_button.dart';
import 'package:sunset_app/widgets/custom_textfield.dart';
import 'package:sunset_app/widgets/errorAlert.dart';
import 'package:sunset_app/widgets/field_title_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String useridentifier = "";
  String password = "";
  int terms = 1;
  bool isGoogleLoading = false;
  bool isFacebookLoading = false;
  bool isAppleLoading = false;
  bool isLoading = false;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  final RoundedLoadingButtonController _loginController =
  RoundedLoadingButtonController();

  handleSignInEmailPassword() async {
    final SignInProvider sp =
    Provider.of<SignInProvider>(context, listen: false);
    sp.signInWithEmailPassword(useridentifier, password).then((value) async {
      if (value) {
        sp
            .getTimestamp()
            .then((value) => sp.saveDataToSP().then((value) => sp.setSignIn()));

        setState(() {
          isLoading = false;
        });
        handleAfterSignIn();
      } else {
        errorAlert(context, LocaleKeys.wrong_username_password);
        setState(() {
          isLoading = false;
        });
        // openSnacbar(scaffoldKey, LocaleKeys.wrong_username_password.tr());
      }
    });
  }
  handleAfterSignIn() {
    setState(() {
      Future.delayed(const Duration(milliseconds: 1000)).then((f) {
        nextScreenCloseOthers(context, const HomePage());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final SignInProvider sp =
    Provider.of<SignInProvider>(context, listen: false);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: context.colors.backgroundSecondary,
      appBar: CustomAppbar(
        backgroundColor: context.colors.backgroundSecondary,
        title: LocaleKeys.login,
        centerTitle: true,
      ),
      body: Padding(
        padding: context.paddingMedium.copyWith(bottom: 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.emptyMediumWidget,
                //Email Login
                FieldTitleWidget(
                  title: LocaleKeys.email,
                ),
                context.emptyLowWidget,
                CustomTextfield(
                  autoFocus: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  hintText: LocaleKeys.login_hint,
                  icon: const Icon(
                    Icons.mail_outline,
                  ),
                  onChanged: (value) {
                    setState(() {
                      useridentifier = value;
                    });
                  },
                ),

                context.emptyLowMediumWidget,
                //Password Login
                FieldTitleWidget(
                  title: LocaleKeys.password,
                ),
                context.emptyLowWidget,
                CustomTextfield(
                  autoFocus: false,
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  hintText: LocaleKeys.password_hint,
                  icon: const Icon(
                    Icons.lock_outline,
                  ),
                  isPassword: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                context.emptyMediumWidget,

                //Login
                RoundedLoadingButton(
                  color: context.colors.orangeColor,
                  controller: _loginController,
                  onPressed: () {},
                  child: !isLoading
                      ? CustomButton(
                    textColor: context.colors.buttonPrimaryText,
                    backgroundColor: context.colors.buttonPrimary,
                    text: LocaleKeys.login,
                    onTap: () {
                      // nextScreen(context, MainPage());
                      setState(() {
                        isLoading = true;
                      });
                      if (useridentifier == "" || password == "") {
                        errorAlert(context, LocaleKeys.empty_area);
                        setState(() {
                          isLoading = false;
                        });
                      } else {
                        handleSignInEmailPassword();
                      }
                    },
                  )
                      : Center(
                      child: CircularProgressIndicator(
                        color: context.colors.whiteColor,
                      )),
                ),

                context.emptyMediumWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
