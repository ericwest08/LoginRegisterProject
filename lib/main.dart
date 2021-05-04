import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rlbasic/pantallas/config_company.dart';
import 'package:rlbasic/pantallas/crear.dart';
import 'package:rlbasic/pantallas/user.dart';
import 'package:rlbasic/pantallas/login.dart';
import 'package:rlbasic/pantallas/register.dart';
import 'package:rlbasic/pantallas/splashScreen.dart';
import 'package:rlbasic/pantallas/termsAndConditions.dart';
import 'package:rlbasic/pantallas/company.dart';
import 'package:rlbasic/pantallas/deliverer.dart';
import 'package:rlbasic/pantallas/config_user.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginPage(),
  "/company": (BuildContext context) => CompanyPage(),
  "/deliverer": (BuildContext context) => DelivererPage(),
  "/configuser": (BuildContext context) => ConfigUserPage(),
  "/user": (BuildContext context) => UserPage(),
  "/register": (BuildContext context) => RegisterPage(),
  "/TermsConditions": (BuildContext context) => TermsAndConditionsPage(),
  "/configcompany": (BuildContext context) => ConfigCompanyPage(),

};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SmartStock',
        theme: ThemeData(
          dividerColor: Colors.grey,
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: routes);
  }
}
