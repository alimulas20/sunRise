import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunset_app/constants/constants.dart';
import 'package:sunset_app/screens/login_signup_view.dart';
import 'dart:math' as math;

import 'package:sunset_app/services/app_services.dart';
import 'package:sunset_app/utils/navigate.dart';

class SignInProvider extends ChangeNotifier {
  SignInProvider() {
    checkSignIn();
  }

  ProfilePicPref profilePicPreferences = ProfilePicPref();

  final dio = Dio();

  bool _isSignedIn = false;

  bool get isSignedIn => _isSignedIn;

  final bool _hasError = false;

  bool get hasError => _hasError;

  String? _errorCode;

  String? get errorCode => _errorCode;

  String? _name;

  String? get name => _name;

  String? _surname;

  String? get surname => _surname;

  String? _gender;

  String? get gender => _gender;

  String? _age;

  String? get age => _age;

  String? _username;

  String? get username => _username;

  String? _uid;

  String? get uid => _uid;

  String? _email;

  String? get email => _email;

  String? _imageUrl;

  String? get imageUrl => _imageUrl;

  String? _signInProvider;

  String? get signInProvider => _signInProvider;

  String? timestamp;

  int? _userExists = 0;

  int? get userExists => _userExists;

  int? _userType = 0;

  int? get userType => _userType;

  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  final math.Random _char = math.Random();

  String usernameGen(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_char.nextInt(_chars.length))));

  static const _nums = '0123456789';
  final math.Random _num = math.Random();

  int passwordGen(int length) =>
      int.parse(String.fromCharCodes(Iterable.generate(
          length, (_) => _nums.codeUnitAt(_num.nextInt(_nums.length)))));

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Future signInWithEmailPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _uid = credential.user!.uid;
      return true;
    } on FirebaseAuthException catch (e) {
      _errorCode = e.code;
      return false;
    }
  }

  Future getUserDetails(BuildContext context) async {
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(uid).get();
    Map<String, dynamic>? data;
    if (docSnapshot.exists) {
      data = docSnapshot.data();
    }
    _name = data!["name"];
    _surname = data["surname"];
    _age = data["age"];
    _gender = data["gender"];
    return data;
  }

  Future userSignOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((value) {
      afterUserSignOut().then((value) {
        nextScreenCloseOthers(context, LoginSignupPage());
      });
    });
  }

  Future afterUserSignOut() async {
    clearAllData();
    _isSignedIn = false;
    notifyListeners();
  }

  Future signUpWithEmailPassword(String email, String name, String password,
      String surname, String age, String gender) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _uid = credential.user!.uid;
      _name = name;
      _surname = surname;
      _age = age;
      _gender = gender;
      Map<String, dynamic> data = {
        "name": name,
        "surname": surname,
        "age": age,
        "gender": gender,
        "registerDate": DateTime.now()
      };
      await addUser(credential.user!.uid, data);
      signInWithEmailPassword(email, password);
      return true;
    } on FirebaseAuthException catch (e) {
      _errorCode = e.code;
      return false;
    } catch (e) {
      print(e);
    }
  }

  Future<int?> checkUserExists() async {
    //Kullanıcı var mı yok mu metodu

    // dio.options.headers["Accept"] = "application/json";
    // dio.options.headers["Authorization"] = "Bearer " + token!;
    log("userexists " + _userExists.toString());

    return await Future.delayed(
        const Duration(milliseconds: 200), () => _userExists);
  }

  Future setSignIn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('signed_in', true);
    _isSignedIn = true;
    notifyListeners();
  }

  void checkSignIn() async {
    final SharedPreferences? sp = await SharedPreferences.getInstance();
    _isSignedIn = sp!.getBool('signed_in') ?? false;
    notifyListeners();
  }

  Future saveDataToSP() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('name', _name ?? "");
    await sp.setString('email', _email ?? "");
    await sp.setString('uid', _uid ?? "");
    await sp.setString('sign_in_provider', _signInProvider ?? "");
    await sp.setString('username', _username ?? "");
  }

  Future getDataFromSp() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _name = sp.getString('name');
    _email = sp.getString('email');
    _uid = sp.getString('uid');
    _signInProvider = sp.getString('sign_in_provider');
    _username = sp.getString('username');
    notifyListeners();
  }

  Future getTimestamp() async {
    DateTime now = DateTime.now();
    String _timestamp = DateFormat('yyyyMMddHHmmss').format(now);
    timestamp = _timestamp;
  }

  Future clearAllData() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
  }
}

class ProfilePicPref {
  static const PRO_PIC_STS = 'PROFILESTATUS';

  setProfilePic(int svgNo) async {
    SharedPreferences profilePref = await SharedPreferences.getInstance();
    profilePref.setInt(PRO_PIC_STS, svgNo);
  }

  Future<int> getProfilePicture() async {
    SharedPreferences profilePref = await SharedPreferences.getInstance();
    return profilePref.getInt(PRO_PIC_STS) ?? 1;
  }
}
