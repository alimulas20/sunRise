import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:sunset_app/core/extensions/color_extension.dart';
import 'package:sunset_app/core/extensions/context_entension.dart';
import 'package:sunset_app/providers/signin_provider.dart';
import 'package:sunset_app/services/app_services.dart';
import 'package:sunset_app/utils/locale_keys.dart';
import 'package:sunset_app/widgets/custom_button.dart';
import 'package:sunset_app/widgets/custom_textfield.dart';
import 'package:sunset_app/widgets/dialogPopup.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

double? lat;
double? long;
late LocationData locData;
late String sunRise;
late String sunSet;
bool _isClicked = false;



class _ExplorePageState extends State<ExplorePage> {



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/bg2.png",
          height: context.height,
          width: context.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LocaleKeys.latitude, style: TextStyle(fontSize: context.mediumValue)),
                Container(
                    decoration: BoxDecoration(
                        color: context.colors.backgroundDialog,
                        borderRadius: BorderRadius.circular(context.mediumValue)
                    ),
                    width: context.width * 0.5,
                    height: context.height * 0.05,
                    child: Center(child: Text(_isClicked ? lat.toString() : " " , style: TextStyle(fontSize: context.mediumValue)))),
                context.emptyMediumWidget,
                Text(LocaleKeys.longitude, style: TextStyle(fontSize: context.mediumValue)),
                Container(
                    decoration: BoxDecoration(
                        color: context.colors.backgroundDialog,
                        borderRadius: BorderRadius.circular(context.mediumValue)
                    ),
                    width: context.width * 0.5,
                    height: context.height * 0.05,
                    child: Center(child: Text(_isClicked ? long.toString() : " ",  style: TextStyle(fontSize: context.mediumValue)))),
                context.emptyHighWidget,
                Visibility(
                  visible: _isClicked ? true : false,
                  child: SizedBox(
                    width: context.width * 0.5,
                    child: CustomButton(
                        text: LocaleKeys.search,
                        onTap: () {
                          getSunTimes(lat!, long!).then((value) {
                            sunRise = value["sunrise"];
                            sunSet = value["sunset"];
                            infoDialog(context, lat!, long!, sunRise, sunSet);
                            setState(() {
                              _isClicked = false;
                            });
                          });
                        }),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: context.colors.orangeColor,
            child: Image.asset('assets/location.png'),
            onPressed: () {
              getLocation().then((value) {
                setState(() {
                  locData = value;
                  lat = locData.latitude!;
                  long = locData.longitude!;
                  _isClicked = true;
                });
              });
            },
          ),
          resizeToAvoidBottomInset: false,
          extendBody: true,
        ),

      ],
    );
  }
}
