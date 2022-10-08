import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Calculate(BuildContext context)
{
  String calculation = "";

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

    return total;
  }

  return calcResult();
}