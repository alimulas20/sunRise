import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunset_app/constants/constants.dart';
import 'package:sunset_app/core/extensions/color_extension.dart';
import 'package:sunset_app/core/extensions/context_entension.dart';
import 'package:sunset_app/models/fav_location_model.dart';
import 'package:sunset_app/providers/signin_provider.dart';
import 'package:sunset_app/utils/locale_keys.dart';
import 'dart:io' as io;
import 'package:location/location.dart';



class AppService {

  Future<bool?> checkInternet() async {
    bool? internet;
    try {
      final result = await io.InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        internet = true;
      }
    } on io.SocketException catch (_) {
      internet = false;
    }
    return internet;
  }
}

Future<void> addUser(String id, Map<String, dynamic> data) async {
  await FirebaseFirestore.instance.collection("users").doc(id).set(data);
}

Future<void> saveLocation(String? id, String locationName, Map<String, dynamic> data) async {
  await FirebaseFirestore.instance.collection("users").doc(id).collection("locations").doc(locationName).set(data).then((value) {
    FirebaseFirestore.instance.collection("users").doc(id).collection("locations").doc(locationName).update({
      "name" : locationName
    });
  });
}

Future getLocation() async {

  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  _locationData = await location.getLocation();
  return _locationData;
}

Future getSunTimes(double lat, double long) async {
  var result = await Dio().post(Constants.baseUrl + "lat=" + lat.toString() + "&lng=" + long.toString());
  return result.data["results"];
}

Future<List<FavModel>> getFavLocations(BuildContext context) async {

  final SignInProvider sp =
  Provider.of<SignInProvider>(context, listen: false);
  CollectionReference refSM =
  FirebaseFirestore.instance.collection('users').doc(sp.uid).collection("locations");

  return  await refSM.get().then(
          (event) => event.docs
          .map((e) =>
          FavModel.fromJson(e.data() as Map<String, dynamic>))
          .toList());
}




