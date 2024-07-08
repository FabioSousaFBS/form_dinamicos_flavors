import 'package:flutter/material.dart';

class GlobalVariables {

  static final GlobalVariables _globalVariables = GlobalVariables._internal();

  String urlBase = "";
  String token = "";
  String companyID = "";
  ThemeData? temaClaro;

  factory GlobalVariables(){
    return _globalVariables;
  }

  GlobalVariables._internal();

}