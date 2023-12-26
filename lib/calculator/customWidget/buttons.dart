import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:vibration/vibration.dart';

class Buttons extends StatelessWidget {
  const Buttons(
      {super.key,
      this.btn,
      this.backgroundColor = const Color.fromARGB(96, 74, 74, 74),
      this.textColor = Colors.white,
      this.icon,
      required this.controller});

  final String? btn;

  final TextEditingController controller;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;

  String getLastSymbol(TextEditingController controller) {
    final text = controller.text;
    if (text.isNotEmpty) {
      return text.substring(text.length - 1);
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 90,
      child: FloatingActionButton(
        shape: const CircleBorder(eccentricity: 0.5),
        onPressed: () {
          Vibration.vibrate(duration: 100);
          if (btn == "C") {
            controller.text = "";
            return;
          }
          if (btn == "=") {
            Parser p = Parser();
            try {
              Expression exp = p.parse(controller.text);
              ContextModel cm = ContextModel();
              double result = exp.evaluate(EvaluationType.REAL, cm);
              controller.text = result.toString();
            } catch (e) {
              controller.text = "";
            }
            return;
          }
          controller.text += btn!;
        },
        backgroundColor: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon == null ? false : true,
              child: Icon(
                icon,
                size: 25,
                color: textColor,
              ),
            ),
            Visibility(
              visible: icon == null ? true : false,
              child: Text(
                btn!,
                style: TextStyle(fontSize: 25, color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
