import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Buttons extends StatelessWidget {
  const Buttons(
      {super.key,
      this.btn1,
      this.btn2,
      this.btn3,
      this.btn4,
      required this.controller});

  final String? btn1;
  final String? btn2;
  final String? btn3;
  final String? btn4;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            onPressed: () {
              if (btn1 == "C") {
                controller.text = "";
                return;
              }
              controller.text += btn1!;
            },
            backgroundColor: Colors.white,
            child: Text(
              btn1!,
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            onPressed: () {
              controller.text += btn2!;
            },
            backgroundColor: Colors.white,
            child: Text(
              btn2!,
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            onPressed: () {
              controller.text += btn3!;
            },
            backgroundColor: Colors.white,
            child: Text(
              btn3!,
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            onPressed: () {
              if (btn4 == "=") {
                Parser p = Parser();
                Expression exp = p.parse(controller.text);
                ContextModel cm = ContextModel();
                double result = exp.evaluate(EvaluationType.REAL, cm);
                controller.text = result.toString();
                return;
              }
              controller.text += btn4!;
            },
            backgroundColor: Colors.white,
            child: Text(
              btn4!,
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
