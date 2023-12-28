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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: FloatingActionButton(
                  shape: const CircleBorder(eccentricity: 0.5),
                  onPressed: () {
                    setState(() {
                      if (inputFieldController.text.isNotEmpty) {
                        inputFieldController.text = inputFieldController.text
                            .substring(0, inputFieldController.text.length - 1);
                      }
                    });
                  },
                  backgroundColor: const Color.fromARGB(96, 74, 74, 74),
                  foregroundColor: Colors.green,
                  child: const Icon(CupertinoIcons.chevron_left_square),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Buttons(
                btn: "C",
                textColor: Colors.red,
                controller: inputFieldController,
              ),
              Buttons(
                btn: "()",
                controller: inputFieldController,
              ),
              Buttons(
                btn: "%",
                controller: inputFieldController,
              ),
              Buttons(
                btn: "/",
                controller: inputFieldController,
                icon: CupertinoIcons.divide,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Buttons(
                btn: "7",
                controller: inputFieldController,
              ),
              Buttons(
                btn: "8",
                controller: inputFieldController,
              ),
              Buttons(
                btn: "9",
                controller: inputFieldController,
              ),
              Buttons(
                btn: "*",
                controller: inputFieldController,
                icon: CupertinoIcons.multiply,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Buttons(
                btn: "4",
                controller: inputFieldController,
              ),
              Buttons(
                btn: "5",
                controller: inputFieldController,
              ),
              Buttons(
                btn: "6",
                controller: inputFieldController,
              ),
              Buttons(
                btn: "-",
                controller: inputFieldController,
                icon: CupertinoIcons.minus,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Buttons(
                btn: "1",
                controller: inputFieldController,
              ),
              Buttons(
                btn: "2",
                controller: inputFieldController,
              ),
              Buttons(
                btn: "3",
                controller: inputFieldController,
              ),
              Buttons(
                btn: "+",
                controller: inputFieldController,
                icon: CupertinoIcons.add,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Buttons(
                btn: "00",
                controller: inputFieldController,
              ),
              Buttons(
                btn: "0",
                controller: inputFieldController,
              ),
              Buttons(
                btn: ".",
                controller: inputFieldController,
              ),
              Buttons(
                btn: "=",
                backgroundColor: Colors.green,
                textColor: Colors.white,
                controller: inputFieldController,
                icon: CupertinoIcons.equal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
