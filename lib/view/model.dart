 import 'package:flutter/material.dart';
 // list of cal items
  List calItems = [
    'C',
    'DEL',
    '+/-',
    '%',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

   bool isOperator(String operatorText) {
    if (operatorText == '%' ||
        operatorText == '+' ||
        operatorText == '-' ||
        operatorText == '/' ||
        operatorText == 'x') {
      return true;
    } else {
      return false;
    }
  }


  
 class ButtonTapped extends StatefulWidget {
   const ButtonTapped({super.key});
 
   @override
   State<ButtonTapped> createState() => _ButtonTappedState();
 }
 
 class _ButtonTappedState extends State<ButtonTapped> {
   @override
   Widget build(BuildContext context) {
     return Container();
   }
 }
