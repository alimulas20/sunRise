import 'package:flutter/material.dart';
import 'package:sunset_app/core/extensions/color_extension.dart';
import 'package:sunset_app/core/extensions/context_entension.dart';
import 'package:sunset_app/models/fav_location_model.dart';
import 'package:sunset_app/services/app_services.dart';
import 'package:sunset_app/utils/locale_keys.dart';
import 'package:sunset_app/widgets/detail_popup.dart';

class SavedLocationsPage extends StatefulWidget {
  const SavedLocationsPage({Key? key}) : super(key: key);

  @override
  State<SavedLocationsPage> createState() => _SavedLocationsPageState();
}

class _SavedLocationsPageState extends State<SavedLocationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getFavLocations(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<FavModel> data = snapshot.data as List<FavModel>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var currentLoc = data[index];
                return GestureDetector(
                  onTap: (){
                    detailPopup(context, currentLoc.latitude, currentLoc.longitude, currentLoc.sunrise, currentLoc.sunset, currentLoc.name);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.lowMediumValue),
                    ),
                    child: ListTile(
                      leading: Image.asset("assets/location.png", color: context.colors.orangeColor),
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
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
