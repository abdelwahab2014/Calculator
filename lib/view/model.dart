
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

// class ButtonTapped extends StatefulWidget {
//   final bool isTextFieldEmpty;
//   final TextEditingController textEditingController;
//   const ButtonTapped({super.key, required this.isTextFieldEmpty, required this.textEditingController});

//   @override
//   State<ButtonTapped> createState() => _ButtonTappedState();
// }

// class _ButtonTappedState extends State<ButtonTapped> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

//   buttonTap(String buttonValue) {
//     if (buttonValue == 'C') {
//       widget.isTextFieldEmpty
//           ? null
//           : setState(() {
//               widget.textEditingController.clear();
//             });
//     } else if (buttonValue == 'DEL') {
//       if (widget.textEditingController.text.isNotEmpty) {
//         if (widget.textEditingController.text == 'error') {
//           widget.textEditingController.clear();
//         } else {
//           widget.textEditingController.text = widget.textEditingController.text
//               .substring(0, widget.textEditingController.text.length - 1);
//         }
//       }
//     } else if (buttonValue == '+/-') {
//       if (widget.textEditingController.text.isNotEmpty &&
//           isOperator(widget.textEditingController.text) == false) {
//         double value;
//         value = double.parse(widget.textEditingController.value.text) * -1;

//         widget.textEditingController.text = value.toString();
//       }
//     } else if (buttonValue == '%') {
//       if (widget.textEditingController.text.isNotEmpty &&
//           !isOperator(
//             widget.textEditingController.text.substring(
//                 widget.textEditingController.text.length - 1,
//                 widget.textEditingController.text.length),
//           )) {
//         double value;
//         value = double.parse(widget.textEditingController.value.text) * 0.01;
//         widget.textEditingController.text = value.toString();
//       } else {
//         widget.textEditingController.text = 'error';
//       }
//     } else if (buttonValue == '=') {
//       if (widget.textEditingController.text.isNotEmpty &&
//           !isOperator(
//             widget.textEditingController.text.substring(
//                 widget.textEditingController.text.length - 1,
//                 widget.textEditingController.text.length),
//           )) {
//         setState(() {
//           String expression = widget.textEditingController.text;
//           expression = expression.replaceAll('x', '*');
//           Parser p = Parser();
//           Expression exp = p.parse(expression);
//           // Bind variables:
//           ContextModel cm = ContextModel();
//           double eval = exp.evaluate(EvaluationType.REAL, cm);
//           widget.textEditingController.text = eval.toString();
//         });
//       } else {
//         setState(() {
//           if (widget.textEditingController.text.isEmpty) {
//           } else {
//             widget.textEditingController.text = "error";
//           }
//         });
//       }
//     } else if (buttonValue == '.') {
//       if (widget.textEditingController.text.isNotEmpty &&
//           !widget.textEditingController.text.contains('.')) {
//         setState(() {
//           widget.textEditingController.text += buttonValue;
//         });
//       }
//     } else if (isOperator(buttonValue) && widget.textEditingController.text.isEmpty) {
//       return null;
//     } else {
//       if (widget.textEditingController.text.isNotEmpty &&
//           isOperator(buttonValue) &&
//           isOperator(widget.textEditingController.text.substring(
//               widget.textEditingController.text.length - 1,
//               widget.textEditingController.text.length))) {
//         widget.textEditingController.text = widget.textEditingController.text.replaceRange(
//             widget.textEditingController.text.length - 1,
//             widget.textEditingController.text.length,
//             buttonValue);
//       } else {
//         setState(() {
//           widget.textEditingController.text += buttonValue;
//         });
//       }
//     }
//   }
// }
