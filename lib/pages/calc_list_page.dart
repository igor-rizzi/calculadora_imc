import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/menu_component.dart';

class CalcListPage extends StatefulWidget {
  const CalcListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CalcListPage> createState() => _CalcListPageState();
}

class _CalcListPageState extends State<CalcListPage> {
  double _result = 0;

  final _inputNum1 = TextEditingController();
  final _inputNum2 = TextEditingController();
  List<String> _list = <String>[];

  void _add() {
    _result = double.parse(_inputNum1.text) + double.parse(_inputNum2.text);

    _setList();
  }

  void _subtract() {
    _result = double.parse(_inputNum1.text) - double.parse(_inputNum2.text);

    _setList();
  }

  void _multiply() {
    _result = double.parse(_inputNum1.text) * double.parse(_inputNum2.text);

    _setList();
  }

  void _divide() {
    _result = double.parse(_inputNum1.text) / double.parse(_inputNum2.text);

    _setList();
  }

  void _setList() {
    _list.add(_result.toString());
    _inputNum1.clear();
    _inputNum2.clear();

    setState(() {
      _list = _list;
    });
  }

  void _limpaLista() {
    _list.clear();

    setState(() {
      _list = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title, textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.restart_alt,
              color: Colors.white,
            ),
            onPressed: _limpaLista,
          )
        ],
      ),
      drawer: Menu(context),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calculate,
                      size: 150,
                      color: Colors.blue,
                    ),
                  ]
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: _inputNum1,
                  style: TextStyle(fontSize: 16)),
              SizedBox(
                height: 10,
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: _inputNum2,
                  style: TextStyle(fontSize: 16)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.add, size: 50, color: Colors.blue),
                    onPressed: _add,
                  ),
                  IconButton(
                    icon: Icon(Icons.remove, size: 50, color: Colors.blue),
                    onPressed: _subtract,
                  ),
                  IconButton(
                      onPressed: _multiply,
                      icon: Text("*",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold))),
                  IconButton(
                      onPressed: _divide,
                      icon: Text("/",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _result.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 500,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: _list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            title: Text('${_list[index]}',
                                style: TextStyle(fontSize: 16)),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                _list.removeAt(index);

                                setState(() {
                                  _list = _list;
                                });
                              },
                            ));
                      })),
            ]),
      ),
    );
  }
}
