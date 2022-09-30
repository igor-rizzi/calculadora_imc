import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/menu_component.dart';

class CalcListApp extends StatefulWidget {
  const CalcListApp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CalcListApp> createState() => _CalcListAppState();
}

class _CalcListAppState extends State<CalcListApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title, textAlign: TextAlign.center),
        ),
        drawer: Menu(context),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(

                )
              ]),
        )
    );
  }
}