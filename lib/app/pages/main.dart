import 'package:flutter/material.dart';

import '../components/button_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String calculation = "";

  double result = 0;

  addCharacter(String text) {
    setState(()  {
      calculation = calculation + text;
    });
  }

  calcResult () {

    List<String> characters = [];
    List<double> numbers = [];

    calculation.split('').forEach((element) => {
      if(element == '*' || element == '/' || element == '-' || element == '+') {
        characters.add(element)
      } else {
        numbers.add(double.parse(element))
      }
    });

    double total = 0;
    int currentCharacter = 0;

    double number1 = numbers[0];
    double number2 = numbers[1];
    switch(characters[currentCharacter]){
      case '+': {
        total = number1 + number2;
        break;
      }
      case '-': {
        total = number1 - number2;
        break;
      }
      case '*': {
        total = number1 * number2;
        break;
      }
      case '/': {
        total = number1 / number2;
        break;
      }
      default: {
        total: total;
        break;
      }
    }
    characters.removeAt(0);

    for(int i = 2 ; i <= numbers.length; i++ ) {

      if(characters.length <= 0) break;

      switch(characters[0]){
        case '+': {
          total = total + numbers[i];
          break;
        }
        case '-': {
          total = total - numbers[i];
          break;
        }
        case '*': {
          total = total * numbers[i];
          break;
        }
        case '/': {
          total = total / numbers[i];
          break;
        }
        default: {
          total: total;
          break;
        }
      }

      characters.removeAt(0);
    }

    setState(() {
      result = total;
    });
  }

  void clearCalculation() {

    setState(() {
      calculation = '';
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.black)),
              child: Column(
                children: <Widget>[
                  Text(calculation, style: TextStyle(
                    fontSize: 16,
                  ),),
                  Text(result.toString(), style: TextStyle(
                    fontSize: 32,
                  ),),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(context, '7',() { addCharacter('7'); }, Colors.blue ),
                Button(context, '8',() { addCharacter('8'); }, Colors.blue ),
                Button(context, '9',() { addCharacter('9'); }, Colors.blue ),
                Button(context, '+',() { addCharacter('+'); }, Colors.black54 ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(context, '4',() { addCharacter('4'); }, Colors.blue ),
                Button(context, '5',() { addCharacter('5'); }, Colors.blue ),
                Button(context, '6',() { addCharacter('6'); }, Colors.blue ),
                Button(context, '-',() { addCharacter('-'); }, Colors.black54 ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(context, '1',() { addCharacter('1'); }, Colors.blue ),
                Button(context, '2',() { addCharacter('2'); }, Colors.blue ),
                Button(context, '3',() { addCharacter('3'); }, Colors.blue ),
                Button(context, '*',() { addCharacter('*'); }, Colors.black54 ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(context, '=',() { calcResult(); }, Colors.black54 ),
                Button(context, '0',() { addCharacter('0'); }, Colors.blue ),
                Button(context, 'c',clearCalculation, Colors.black54 ),
                Button(context, '/',() { addCharacter('/'); }, Colors.black54 ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
