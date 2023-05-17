import 'package:calculator/view/model.dart';
import 'package:calculator/view/my_buttons.dart';
import 'package:calculator/widgets/app_bar.dart';
import 'package:calculator/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Define button color
  Color? buttonColor;
  // controller
  TextEditingController textEditingController = TextEditingController();
  bool isTextFieldEmpty = true;
  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      setState(() {
        isTextFieldEmpty = textEditingController.text.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var padding2 = screenSize.width * 0.03;
    var crossAxisSpacing = screenSize.width * 0.0001;
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: Padding(
          padding: EdgeInsets.all(padding2),
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              TextFieldWidget(textEditingController: textEditingController),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, crossAxisSpacing: crossAxisSpacing),
                  itemCount: calItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Mybuttons(
                      buttonTapped: () => buttonTap(calItems[index]),
                      textColor: Colors.white,
                      buttonColor: isOperator(calItems[index])
                          ? Colors.black
                          : calItems[index] == 'DEL'
                              ? Colors.blue
                              : calItems[index] == 'C'
                                  ? Colors.red
                                  : calItems[index] == '='
                                      ? Colors.green
                                      : Colors.grey,
                      buttonText: calItems[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buttonTap(String buttonValue) {
    if (buttonValue == 'C') {
      isTextFieldEmpty
          ? null
          : setState(() {
              textEditingController.clear();
            });
    } else if (buttonValue == 'DEL') {
      if (textEditingController.text.isNotEmpty) {
        if (textEditingController.text == 'error') {
          textEditingController.clear();
        } else {
          textEditingController.text = textEditingController.text
              .substring(0, textEditingController.text.length - 1);
        }
      }
    } else if (buttonValue == '+/-') {
      if (textEditingController.text.isNotEmpty &&
          isOperator(textEditingController.text) == false) {
        double value;
        value = double.parse(textEditingController.value.text) * -1;

        textEditingController.text = value.toString();
      }
    } else if (buttonValue == '%') {
      if (textEditingController.text.isNotEmpty &&
          !isOperator(
            textEditingController.text.substring(
                textEditingController.text.length - 1,
                textEditingController.text.length),
          )) {
        double value;
        value = double.parse(textEditingController.value.text) * 0.01;
        textEditingController.text = value.toString();
      } else {
        textEditingController.text = 'error';
      }
    } else if (buttonValue == '=') {
      if (textEditingController.text.isNotEmpty &&
          !isOperator(
            textEditingController.text.substring(
                textEditingController.text.length - 1,
                textEditingController.text.length),
          )) {
        setState(() {
          String expression = textEditingController.text;
          expression = expression.replaceAll('x', '*');
          Parser p = Parser();
          Expression exp = p.parse(expression);
          // Bind variables:
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          textEditingController.text = eval.toString();
        });
      } else {
        setState(() {
          if (textEditingController.text.isEmpty) {
          } else {
            textEditingController.text = "error";
          }
          //Future.delayed(const Duration(seconds: 10));
          //textEditingController.clear();
        });
      }
    } else if (buttonValue == '.') {
      if (textEditingController.text.isNotEmpty &&
          !textEditingController.text.contains('.')) {
        setState(() {
          textEditingController.text += buttonValue;
        });
      }
    } else if (isOperator(buttonValue) && textEditingController.text.isEmpty) {
      return null;
    } else {
      if (textEditingController.text.isNotEmpty &&
          isOperator(buttonValue) &&
          isOperator(textEditingController.text.substring(
              textEditingController.text.length - 1,
              textEditingController.text.length))) {
        textEditingController.text = textEditingController.text.replaceRange(
            textEditingController.text.length - 1,
            textEditingController.text.length,
            buttonValue);
      } else {
        setState(() {
          textEditingController.text += buttonValue;
        });
      }
    }
  }
}
