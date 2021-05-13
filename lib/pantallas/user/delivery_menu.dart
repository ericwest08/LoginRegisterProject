import 'package:flutter/cupertino.dart';
import 'package:rlbasic/models/_aux.dart';
import 'package:flutter/material.dart';
import 'package:rlbasic/my_navigator.dart';

class DeliveryMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeliveryMenuScreen(),
    );
  }
}

class DeliveryMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff5808e5),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'GET READY', icon: Icon(Icons.alarm_add)),
                Tab(text: 'PRODUCT TO PICK UP', icon: Icon(Icons.alarm_on)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: GetReady()),
              Center(child: PickUp()),
            ],
          ),
        ),
      ),
    );
  }
}

class GetReady extends StatelessWidget {
  //CAMBIAR A LISTA DE LOTES
  final items = List<String>.generate(3, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              //CAMBIAR POR LOTE
              builder: (BuildContext context) =>
                  _buildPopupDialog(context, items[index]),
            );
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_right),
                  title: Text('${items[index]}'),
                  subtitle: Text('Pick up day: ${items[index]}'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class PickUp extends StatelessWidget {
  //CAMBIAR A LISTA DE LOTES
  final items = List<String>.generate(3, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              //CAMBIAR POR LOTE
              builder: (BuildContext context) =>
                  _buildPopupDialog(context, items[index]),
            );
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.av_timer),
                  title: Text('${items[index]}'),
                  subtitle: Text('Pick up day: ${items[index]}'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildPopupDialog(BuildContext context, String item) {
  final bool value;
  final Function onChange;

  return new AlertDialog(
    title: const Text('TO BE READY'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Items to add:'),
       /*  CheckboxListTile(
          title: Text('nombre de items'),
          secondary: Text('numero de items'),
          value: value,
          onChanged: (bool? newValue) {
            onChanged(newValue);
          },
        ) */
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}

class Menu extends StatelessWidget {
  final Aux aux = new Aux("id", "token", "userName");
  //final Aux aux;
  // DeliveryMenu({required this.aux});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(aux.userName, semanticsLabel: "Bienvenido"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
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
                onTap: () {
                  MyNavigator.goToSearchProducts(context);
                }),
            ListTile(
                leading: Icon(Icons.apartment),
                title: Text('Mis productos almacenados'),
                onTap: () {
                  Navigator.of(context).pushNamed("");
                }),
            ListTile(
                leading: Icon(Icons.motorcycle),
                title: Text('Productos para entregar'),
                onTap: () {
                  MyNavigator.goToUserDeliveryMenu(context);
                }),
            ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Configuración'),
                onTap: () {
                  MyNavigator.goToConfigUser(context);
                }),
          ],
        ),
      ),
    );
  }
}
