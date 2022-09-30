import 'package:calculadora_imc/pages/calc_list_app.dart';
import 'package:calculadora_imc/pages/calc_list_page.dart';

import '../pages/about_page.dart';
import '../pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Menu(BuildContext context) {
  return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text('testete'), // keep blank text because email is required
            accountName: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: CircleAvatar(
                    child: Image.asset('assets/Profile-PNG-File.png')
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Igor'),
                    Text('igor.rizzi2@gmail.com'),
                  ],
                ),
              ],
            ),
          ),

          ListTile(
            title: const Text('Home Page'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(title: 'My Home Page')));
            },
          ),
          ListTile(
            title: const Text('About Page'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AboutPage(title: 'About Page')));
            },
          ),
          ListTile(
            title: const Text('Calculadora Lista'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CalcListPage(title: 'Calc List Page')));
            },
          ),
          ListTile(
            title: const Text('Calculadora App Android'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CalcListApp(title: 'Calc List App')));
            },
          ),
        ],
      )


  );
}
