// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunset_app/core/color_extension.dart';
import 'package:sunset_app/core/context_entension.dart';
import 'package:sunset_app/providers/signin_provider.dart';
import 'package:sunset_app/screens/main_page.dart';
import 'package:sunset_app/utils/locale_keys.dart';
import 'package:sunset_app/widgets/errorAlert.dart';
import '../utils/navigate.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/field_title_widget.dart';
import '../widgets/custom_appbar.dart';

class SignupMailPage extends StatefulWidget {
  SignupMailPage({Key? key}) : super(key: key);

  @override
  State<SignupMailPage> createState() => _SignupMailPageState();
}

class _SignupMailPageState extends State<SignupMailPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController currentController = TextEditingController();

  late String password;
  String email = "";
  late String name;
  late String surname;
  late String age;
  String? gender;
  bool emailValid = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> genderList = [
    'Erkek',
    'Kadın',
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    gender = genderList[0];
  }

  handleSignUpEmailPassword() async {
    final SignInProvider sp =
        Provider.of<SignInProvider>(context, listen: false);
    sp
        .signUpWithEmailPassword(email, name, password, surname, age, gender!)
        .then((value) async {
      if (value) {
        nextScreenCloseOthers(context, const HomePage());
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String> user = [email, password, DateTime.now().toString()];
        prefs.setStringList("id", user);
      } else {
        errorAlert(context, sp.errorCode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: context.colors.backgroundSecondary,
      appBar: CustomAppbar(
        title: "Kayıt",
        centerTitle: true,
        backgroundColor: context.colors.backgroundSecondary,
      ),
      body: Padding(
        padding: context.paddingMedium,
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldTitleWidget(
                      title: LocaleKeys.email,
                    ),
                    context.emptyLowWidget,
                    CustomTextfield(
                      autoFocus: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: mailController,
                      hintText: LocaleKeys.login_hint,
                      icon: const Icon(
                        Icons.mail_outline,
                      ),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                          emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email);
                        });
                      },
                    ),
                    context.emptyMediumWidget,
                    FieldTitleWidget(
                      title: LocaleKeys.password,
                    ),
                    context.emptyLowWidget,
                    CustomTextfield(
                      autoFocus: false,
                      keyboardType: TextInputType.number,
                      controller: passwordController,
                      hintText: LocaleKeys.password_hint,
                      icon: const Icon(
                        Icons.password,
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    context.emptyMediumWidget,
                    FieldTitleWidget(
                      title: LocaleKeys.what_is_your_name,
                    ),
                    context.emptyLowWidget,
                    CustomTextfield(
                      autoFocus: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: nameController,
                      hintText: LocaleKeys.what_is_your_name,
                      icon: const Icon(
                        Icons.person_outline,
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    context.emptyMediumWidget,
                    FieldTitleWidget(
                      title: LocaleKeys.surname,
                    ),
                    context.emptyLowWidget,
                    CustomTextfield(
                      autoFocus: false,
                      keyboardType: TextInputType.text,
                      controller: surnameController,
                      hintText: LocaleKeys.surname,
                      icon: const Icon(
                        Icons.person_outline,
                      ),
                      onChanged: (value) {
                        setState(() {
                          surname = value;
                        });
                      },
                    ),
                    context.emptyMediumWidget,
                    FieldTitleWidget(
                      title: LocaleKeys.age,
                    ),
                    context.emptyLowWidget,
                    CustomTextfield(
                      autoFocus: false,
                      keyboardType: TextInputType.number,
                      controller: ageController,
                      hintText: LocaleKeys.age,
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                      onChanged: (value) {
                        setState(() {
                          age = value;
                        });
                      },
                    ),
                    context.emptyMediumWidget,
                    FieldTitleWidget(
                      title: LocaleKeys.gender,
                    ),
                    context.emptyLowWidget,
                    RadioListTile(
                      activeColor: context.colors.orangeColor,
                      title: Text("Erkek"),
                      value: "Erkek",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      activeColor: context.colors.orangeColor,
                      title: Text("Kadın"),
                      value: "Kadın",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                CustomButton(
                    text: LocaleKeys.okey,
                    onTap: () {
                      if (passwordController.text.length < 6) {
                        errorAlert(context, LocaleKeys.password_error);
                      } else if (emailValid == false) {
                        errorAlert(context, LocaleKeys.email_invalid);
                      } else {
                        handleSignUpEmailPassword();
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
