import '../pages/about_page.dart';
import '../pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Menu(BuildContext context)
{
  return Drawer(
      child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              margin: EdgeInsets.only(bottom: 10.0),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,

                        image:
                        NetworkImage("https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png"))),
              ),
              accountName: new Container(
                  child: Text(
                    'Igor',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              accountEmail: new Container(
                  child: Text(
                    'igor.rizzi2@gmail.com',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            ListTile(
              title: const Text('Home Page'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(title: 'My Home Page'))
                );
              },
            ),
            ListTile(
              title: const Text('Home Page'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage(title: 'About Page'))
                );
              },
            ),
          ]
      )
  );
}