import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:core';


class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<Widget> datosUsuario = [];

  getUser() async {
    var url = Uri.parse("http://localhost:4000/logIn");
    var response = await http.get(url);
    debugPrint(response.body);
  }

  @override
  initState() {
    super.initState();
    //getUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('¡Bienvenido usuario!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Perfil',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_business_rounded),
              title: Text('Buscar productos'),
             
            ),
            ListTile(
              leading: Icon(Icons.apartment),
              title: Text('Mis productos almacenados'),
            ),
            ListTile(
              leading: Icon(Icons.motorcycle),
              title: Text('Productos para entregar'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Configuración'),
            ),
          ],
        ),
      ),
    ));
  }
}
