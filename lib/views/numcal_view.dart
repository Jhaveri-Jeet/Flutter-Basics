import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../customWidget/buttons.dart';
import '../customWidget/inputfield.dart';

class NumberCalculator extends StatefulWidget {
  const NumberCalculator({super.key});

  @override
  State<NumberCalculator> createState() => _NumberCalculatorState();
}

class _NumberCalculatorState extends State<NumberCalculator> {
  final inputFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          InputField(controller: inputFieldController),
          const Spacer(),
          SizedBox(
            height: 80,
            width: 80,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (inputFieldController.text.isNotEmpty) {
                    inputFieldController.text = inputFieldController.text
                        .substring(0, inputFieldController.text.length - 1);
                  }
                });
              },
              backgroundColor: Colors.white,
              child: const Icon(CupertinoIcons.chevron_left_square),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Buttons(
            btn1: "C",
            btn2: "()",
            btn3: "%",
            btn4: "/",
            controller: inputFieldController,
          ),
          const SizedBox(
            height: 20,
          ),
          Buttons(
            btn1: "7",
            btn2: "8",
            btn3: "9",
            btn4: "*",
            controller: inputFieldController,
          ),
          const SizedBox(
            height: 20,
          ),
          Buttons(
            btn1: "4",
            btn2: "5",
            btn3: "6",
            btn4: "-",
            controller: inputFieldController,
          ),
          const SizedBox(
            height: 20,
          ),
          Buttons(
            btn1: "1",
            btn2: "2",
            btn3: "3",
            btn4: "+",
            controller: inputFieldController,
          ),
          const SizedBox(
            height: 20,
          ),
          Buttons(
            btn1: "~",
            btn2: "0",
            btn3: ".",
            btn4: "=",
            controller: inputFieldController,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
