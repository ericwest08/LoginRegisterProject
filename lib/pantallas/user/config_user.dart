import 'package:flutter/material.dart';
import 'dart:core';
import '../../my_navigator.dart';
import 'package:rlbasic/models/globalData.dart';
import 'package:rlbasic/services/userServices.dart';
import './user.dart';

GlobalData globalData = GlobalData.getInstance()!;

class ConfigUserPage extends StatefulWidget {
  @override
  _ConfigUserPageState createState() => _ConfigUserPageState();
}

class _ConfigUserPageState extends State<ConfigUserPage> {
  Widget stack() {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/smartstock.jpeg'),
          radius: 100,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            'SmartStockUser',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  void popup(BuildContext context) {
    var alert = AlertDialog(
      title: const Text('Cerrar sesión'),
      content: new SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text("¿Estas seguro?"),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            globalData.setInstance();
            MyNavigator.goToLogin(context);
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Aceptar'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop('Cancelar');
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Cancelar'),
        )
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      stack(),
      ListTile(
          leading: Icon(Icons.house),
          title: Text(globalData.userName),
          onTap: () {
            Navigator.of(context).pushNamed("");
          }),
      ListTile(
          leading: Icon(Icons.email),
          title: Text(globalData.email),
          onTap: () {
            Navigator.of(context).pushNamed("");
          }),
      ListTile(
          leading: Icon(Icons.home_repair_service),
          title: Text(globalData.location),
          onTap: () {
            Navigator.of(context).pushNamed("");
          }),
      ListTile(
          leading: Icon(Icons.security),
          title: Text('Cambia la contraseña'),
          onTap: () {
            MyNavigator.goToForgotPassword(context);
          }),
      ListTile(
          leading: Icon(Icons.info),
          title: Text('FAQ'),
          onTap: () {
            Navigator.of(context).pushNamed("");
          }),
      ListTile(
          leading: Icon(Icons.info),
          title: Text('Políticas de privacidad'),
          onTap: () {
            Navigator.of(context).pushNamed("");
          }),
      ListTile(
          leading: Icon(Icons.info),
          title: Text('Soporte'),
          onTap: () {
            Navigator.of(context).pushNamed("");
          }),
      ListTile(
          leading: Icon(Icons.info),
          title: Text('Términos y Condiciones'),
          onTap: () {
            MyNavigator.goToTerms(context);
          }),
      ListTile(
          leading: Icon(Icons.account_balance),
          title: Text('Cuenta bancaria'),
          onTap: () {
            Navigator.of(context).pushNamed("");
          }),
      ListTile(
          leading: Icon(Icons.arrow_circle_down_rounded),
          title: Text('Cerrar sesión'),
          onTap: () {
            popup(context);
          })
    ]));
  }
}
