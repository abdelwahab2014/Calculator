import 'package:flutter/material.dart';

class Mybuttons extends StatelessWidget {
  final Color textColor;
  final Color buttonColor;
  final String buttonText;
  // ignore: prefer_typing_uninitialized_variables
  final  buttonTapped;

  const Mybuttons(
      {super.key,
      required this.textColor,
      required this.buttonColor,
      required this.buttonText,required this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: buttonColor,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}




//  GestureDetector(
//                     onTap: () {
//                       if (calItems[index] == 'C') {
//                         textEditingController.clear();
//                       } else if (calItems[index] == 'DEL') {
//                         if (textEditingController.text.isNotEmpty) {
//                           textEditingController.text =
//                               textEditingController.text.substring(
//                                   0, textEditingController.text.length - 1);
//                         }
//                       } else if (calItems[index] == '=') {
//                       } else if (calItems[index] == '+/-') {
//                         int value;
//                         value =
//                             int.parse(textEditingController.value.text) * -1;

//                         textEditingController.text = value.toString();
//                       } else if (calItems[index] == '%') {
//                         double value;
//                         value = double.parse(textEditingController.value.text) *
//                             0.01;

//                         textEditingController.text = value.toString();
//                       } else {
//                         if (textEditingController.text.length < 5 &&
//                             textEditingController.text[0] != '0') {
//                           textEditingController.text += calItems[index];
//                         }
//                       }
//                     },
//                     child: