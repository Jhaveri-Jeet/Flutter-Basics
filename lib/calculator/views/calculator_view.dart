import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Making the Widget Statefull bcz this widget wil change according to the changes in the input field
class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  // Creating the variables which will need to be add
  num x = 0;
  num y = 0;
  num z = 0;

  // The controllers which will controller the value of the input field
  final firstInputController = TextEditingController();
  final secondInputController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Assigning variables to the controller
    firstInputController.text = x.toString();
    secondInputController.text = y.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        // Children will use when you will add more then one widget in your main widget
        children: [
          InputField(
              hint: "Enter First Number : ", controller: firstInputController),
          const SizedBox(
            height: 30,
          ),
          InputField(
              hint: "Enter Second Number : ",
              controller: secondInputController),
          const SizedBox(
            height: 30,
          ),
          Text(
            z.toString(),
            style: const TextStyle(
              fontSize: 60,
              color: Colors.white,
            ),
          ),
          // This will add space in your screen
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  // This funtion will change the state of the z in every change
                  setState(() {
                    z = num.tryParse(firstInputController.text)! +
                        num.tryParse(secondInputController.text)!;
                  });
                },
                backgroundColor: Colors.white,
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(firstInputController.text)! -
                        num.tryParse(secondInputController.text)!;
                  });
                },
                backgroundColor: Colors.white,
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(firstInputController.text)! *
                        num.tryParse(secondInputController.text)!;
                  });
                },
                backgroundColor: Colors.white,
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(firstInputController.text)! /
                        num.tryParse(secondInputController.text)!;
                  });
                },
                backgroundColor: Colors.white,
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// Created a another widget for the input field [ we can create an another seperate file for this ]
class InputField extends StatelessWidget {
  const InputField(
      {super.key, this.hint = "Enter a number", required this.controller});

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.white,
          )),
    );
  }
}
