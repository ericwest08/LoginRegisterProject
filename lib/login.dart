import 'dart:developer';
import 'dart:math';
import 'termsAndConditions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rlbasic/crear.dart';
import 'package:rlbasic/entrar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rlbasic/services/userServices.dart';
import 'dart:async';
import 'dart:convert';
import 'register.dart';
import 'entrar.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _formKey = GlobalKey<FormState>();
  var email, password, token;
  bool _isLoading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // logIn(String email, String pass) async {
    //   var url = Uri.parse('http://localhost:4000/api/users/logIn');
    //   SharedPreferences sharedPreferences =
    //       await SharedPreferences.getInstance();
    //   Map body = {"email": email, "password": pass};
    //   var jsonResponse;
    //   var res = await http.post(url, body: body);
    //   if (res.statusCode == 200) {
    //     jsonResponse = json.decode(res.body);
    //     print("Response status: ${res.statusCode}");
    //     print("Response status: ${res.body}");

    //     if (jsonResponse != null) {
    //       setState(() {
    //         _isLoading = false;
    //       });

    //       sharedPreferences.setString("token", jsonResponse["token"]);
    //       Navigator.of(context)
    //           .push(MaterialPageRoute(builder: (context) => RegisterPage()));
    //     }
    //   } else {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //     print("Response status: ${res.body}");
    //   }
    // }

    createEmailInput() {
      return TextFormField(
        decoration: InputDecoration(hintText: 'Usuario o Email'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, introduce un texto';
          } else
            return null;
        },
        onChanged: (val) {
          email = val;
        },
      );
    }

    createPasswordInput() {
      return TextFormField(
        decoration: InputDecoration(hintText: 'Contraseña'),
        controller: _passController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, introduce un texto';
          } else
            return null;
        },
        obscureText: true,
        onChanged: (val) {
          password = val;
        },
      );
    }

    createLoginButton(BuildContext context) {
      return Container(
          padding: const EdgeInsets.only(top: 30),
          child: ElevatedButton(
              child: Text(
                'Entrar',
              ),
              onPressed: () {
                UserServices().login(email, password).then((val) {
                  print(val.data);
                  if (val.data['success']) {
                    token = val.data['token'];
                    Fluttertoast.showToast(
                        msg: 'loged',
                        toastLength: Toast.LENGTH_SHORT,
                        timeInSecForIosWeb: 6);
                  }
                });
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EntrarPage()));
                // _emailController.text == "" || _passController.text == ""
                //     ? null
                //     // ignore: unnecessary_statements
                //     : () {
                //         setState(() {
                //           _isLoading = true;
                //         });
                //         logIn(_emailController.text, _passController.text);
                //       };
              }));
    }

    createLinks() {
      return ButtonBar(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              child: Text('¿Has olvidado la contraseña?'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => TermsAndConditionsPage()),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              child: Text('Registrarse'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
            ),
          )
        ],
      );
    }

    divisor() {
      return Container(
          padding: const EdgeInsets.only(top: 5),
          child: Row(children: [
            Expanded(child: Divider(height: 1)),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('ó')),
            Expanded(child: Divider(height: 1))
          ]));
    }

    facebookButton() {
      return Container(
          padding: const EdgeInsets.only(top: 32),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(FontAwesomeIcons.facebookSquare),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text('Entrar con Facebook', textAlign: TextAlign.center),
              )
            ]),
            onPressed: () {},
          ));
    }

    return Scaffold(
      //key: _formKey,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        children: <Widget>[
          Image.asset(
            'assets/images/smartstock.jpeg',
            width: 300.00,
            height: 240,
          ),
          createEmailInput(),
          createPasswordInput(),
          createLoginButton(context),
          createLinks(),
          divisor(),
          facebookButton()
        ],
      ),
    );
  }
}
