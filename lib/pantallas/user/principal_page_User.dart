import 'package:flutter/material.dart';
import 'package:rlbasic/main.dart';
import 'package:rlbasic/models/globalData.dart';
import 'package:rlbasic/models/lot.dart';
import 'package:rlbasic/models/user.dart';
import 'package:rlbasic/my_navigator.dart';
import 'package:rlbasic/pantallas/login.dart';
import 'package:rlbasic/pantallas/user/listStoredProducts.dart';
import 'dart:core';
import 'package:rlbasic/services/lotServices.dart';
import 'package:rlbasic/services/userServices.dart';

class DataGenericUserPage extends StatefulWidget {
  @override
  _DataGenericUserPageState createState() =>
      _DataGenericUserPageState();
}

class _DataGenericUserPageState
    extends State<DataGenericUserPage> {

  GlobalData globalData = GlobalData.getInstance()!;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data ' + globalData.userName),
      ),
      body: buildSuggestions(),
    );
  }
}


  @override
  Widget buildSuggestions() {
    
    return _showDataUser();

  }


Widget _showDataUser() {
  final userServices = new UserServices();
  globalData.setBadges(userServices.getBadges(globalData.id));
  return ListView(
          children: <Widget>[
            Text("Nombre: " + globalData.userName),
            Text("Email: " + globalData.email),
            Text("Rol: " + globalData.role),
            Text("Número de insignias por logearse: " + globalData.badges.toString()),
          ],
        );
}


