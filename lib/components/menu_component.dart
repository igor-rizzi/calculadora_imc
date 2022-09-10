import '../pages/about_page.dart';
import '../pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Menu(BuildContext context)
{
  return Drawer(
    child: Center(
      child: Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountEmail: new Container(
                  child: Text(
                  'igor.rizzi2@gmail.com',
                  style: TextStyle(color: Colors.black),
                )
              ),
              accountName: new Container(
                  child: Text(
                    'Igor Henrique Rizzi',
                    style: TextStyle(color: Colors.black),
                  )
              ),
              decoration: BoxDecoration(color: Colors.white),
              currentAccountPicture: new CircleAvatar(
                radius: 50.0,
                backgroundColor: const Color(0xFF778899),
                backgroundImage:
                NetworkImage("http://tineye.com/images/widgets/mona.jpg"),
              ),
            ),
      ],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
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
              title: const Text('About Page'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage(title: 'About Page'))
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}