import 'package:flutter/material.dart';
import 'package:sunset_app/core/color_extension.dart';
import 'package:sunset_app/core/context_entension.dart';
import 'package:sunset_app/models/fav_location_model.dart';
import 'package:sunset_app/services/app_services.dart';
import 'package:sunset_app/widgets/custom_appbar.dart';
import 'package:sunset_app/widgets/custom_textfield.dart';
import 'package:sunset_app/widgets/detail_popup.dart';

class SavedLocationsPage extends StatefulWidget {
  const SavedLocationsPage({Key? key}) : super(key: key);

  @override
  State<SavedLocationsPage> createState() => _SavedLocationsPageState();
}

String keyword = "";
TextEditingController keywordController = TextEditingController();
search(BuildContext context) {
  return FutureBuilder(
    future: getFavLocations(context),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<FavModel> data = snapshot.data as List<FavModel>;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            var currentLoc = data[index];
            if (data[index].name!.contains(keyword)) {
              return GestureDetector(
                onTap: () {
                  detailPopup(
                    context,
                    currentLoc.latitude,
                    currentLoc.longitude,
                    currentLoc.sunrise,
                    currentLoc.sunset,
                    currentLoc.name,
                    currentLoc.date,
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.lowMediumValue),
                  ),
                  child: ListTile(
                    leading: Image.asset("assets/location.png",
                        color: context.colors.orangeColor),
                    contentPadding: context.paddingLowMedium,
                    title: Text(
                      currentLoc.name.toString(),
                      style: const TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        );
      } else {
        return const CircularProgressIndicator();
      }
    },
  );
}

class _SavedLocationsPageState extends State<SavedLocationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          title: "Favoriler", centerTitle: true, backButton: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            CustomTextfield(
              controller: keywordController,
              keyboardType: TextInputType.text,
              autoFocus: false,
              onEditingComplete: () {
                setState(() {
                  keyword = keywordController.text;
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  currentFocus.unfocus();
                });
              },
            ),
            Container(
              child: search(context),
              width: context.width * .9,
              height: context.height * .8,
            )
          ]),
        ),
      ),
    );
  }
}
