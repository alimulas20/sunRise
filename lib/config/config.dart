
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Config {
  static final Config instance = Config._private();
  Config._private();
  factory Config() => instance;


  final Color appColor = const Color(0xFFEF9500);

  final dio = Dio();






}
