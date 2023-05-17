import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
 final TextEditingController textEditingController;
  const TextFieldWidget({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
      var screenSize = MediaQuery.of(context).size;
    var padding = screenSize.width * 0.02;
    var borderRadius = screenSize.width * 0.02;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextField(
        controller: textEditingController,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9].")),
        ],
        readOnly: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
