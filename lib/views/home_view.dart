import 'package:demo/views/numcal_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child:
              NumberCalculator()), // Taking the calculator view to display in the main screen
    );
  }
}
