import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunset_app/core/extensions/color_extension.dart';
import 'package:sunset_app/core/extensions/context_entension.dart';
import 'package:sunset_app/providers/signin_provider.dart';
import 'package:sunset_app/services/app_services.dart';
import 'package:sunset_app/utils/locale_keys.dart';
import 'package:sunset_app/widgets/custom_appbar.dart';
import 'package:sunset_app/widgets/custom_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? user;

  @override
  void initState() {
    // //getUserDetails(context);
    // var a = getUserDetails(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SignInProvider sp =
        Provider.of<SignInProvider>(context, listen: false);
    return Scaffold(
      appBar:
          CustomAppbar(title: "Profil", centerTitle: true, backButton: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 96,
              height: 96,
              child: Image.asset(
                "assets/profile.png",
                // fit: BoxFit.fill,
              ),
            ),
            context.emptyMediumWidget,
            Text(LocaleKeys.what_is_your_name,
                style: TextStyle(fontSize: context.mediumValue, color: context.colors.backgroundDialog)),
            Container(
                decoration: BoxDecoration(
                  color: context.colors.backgroundDialog,
                  borderRadius: BorderRadius.circular(context.mediumValue)
                ),
                width: context.width * 0.5,
                height: context.height * 0.05,
                child: Center(
                    child: Text(sp.name.toString(),
                        style: TextStyle(fontSize: context.mediumValue, color: context.colors.softRedColor)))),
            context.emptyLowWidget,
            Text(LocaleKeys.surname,
                style: TextStyle(fontSize: context.mediumValue, color: context.colors.backgroundDialog)),
            Container(
                decoration: BoxDecoration(
                    color: context.colors.backgroundDialog,
                    borderRadius: BorderRadius.circular(context.mediumValue)
                ),
                width: context.width * 0.5,
                height: context.height * 0.05,
                child: Center(
                    child: Text(sp.surname.toString(),
                        style: TextStyle(fontSize: context.mediumValue, color: context.colors.softRedColor)))),
            context.emptyLowWidget,
            Text(LocaleKeys.age,
                style: TextStyle(fontSize: context.mediumValue, color: context.colors.backgroundDialog)),
            Container(
                decoration: BoxDecoration(
                    color: context.colors.backgroundDialog,
                    borderRadius: BorderRadius.circular(context.mediumValue)
                ),
                width: context.width * 0.5,
                height: context.height * 0.05,
                child: Center(
                    child: Text(sp.age.toString(),
                        style: TextStyle(fontSize: context.mediumValue, color: context.colors.softRedColor)))),
            context.emptyLowWidget,
            Text(LocaleKeys.gender,
                style: TextStyle(fontSize: context.mediumValue, color: context.colors.backgroundDialog)),
            Container(
                decoration: BoxDecoration(
                    color: context.colors.backgroundDialog,
                    borderRadius: BorderRadius.circular(context.mediumValue)
                ),
                width: context.width * 0.5,
                height: context.height * 0.05,
                child: Center(
                    child: Text(sp.gender.toString(),
                        style: TextStyle(fontSize: context.mediumValue, color: context.colors.softRedColor)))),
            context.emptyHighWidget,
            SizedBox(
              width: context.width*0.5,
              child: CustomButton(
                backgroundColor: context.colors.backgroundDialog,
                  textColor: context.colors.orangeColor,
                  text: LocaleKeys.logout,
                  onTap: () {
                    sp.userSignOut(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
