import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.right,
      showCursor: true,
      readOnly: true,
      autofocus: true,
      keyboardType: TextInputType.number,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 40,
      ),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
