import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunset_app/core/color_extension.dart';
import 'package:sunset_app/core/context_entension.dart';
import 'package:sunset_app/providers/signin_provider.dart';
import 'package:sunset_app/screens/sign_up_view.dart';
import 'package:sunset_app/screens/signin_page.dart';
import 'package:sunset_app/utils/locale_keys.dart';
import '../utils/navigate.dart';

import '../widgets/custom_button.dart';
import '../widgets/errorAlert.dart';
import 'main_page.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({Key? key}) : super(key: key);

  @override
  State<LoginSignupPage> createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String useridentifier = "";
  String password = "";
  int date = 0;
  int terms = 1;
  bool isLoading = false;
  bool isLoggedIn = false;
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
        errorAlert(context, LocaleKeys.username_pasword_changed);
        setState(() {
          isLoading = false;
          isLoggedIn = false;
        });
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
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? user = prefs.getStringList("id");
    if (user != null &&
        user[0] != "" &&
        DateTime.now().year == DateTime.parse(user[2]).year &&
        DateTime.now().month == DateTime.parse(user[2]).month &&
        DateTime.now().day == DateTime.parse(user[2]).day) {
      setState(() {
        isLoggedIn = true;
        useridentifier = user[0];
        password = user[1];
        handleSignInEmailPassword();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final SignInProvider sp = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: !isLoggedIn
          ? Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        textColor:
                                            context.colors.buttonPrimaryText,
                                        backgroundColor:
                                            context.colors.buttonPrimary,
                                        text: LocaleKeys.login,
                                        onTap: () {
                                          navigateLoginPage(context);
                                        },
                                      ),
                                      context.emptyLowMediumWidget,
                                      //Hesap Oluştur Butonu
                                      CustomButton(
                                        text: LocaleKeys.create_account,
                                        textColor:
                                            context.colors.buttonSecondaryText,
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
            )
          : Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      LocaleKeys.logging_in_saved_user,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    CircularProgressIndicator(
                      color: context.colors.blackColor,
                    ),
                  ]),
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
    return const BoxDecoration();
  }
}
