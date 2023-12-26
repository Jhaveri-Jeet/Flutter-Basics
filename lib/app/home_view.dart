import 'package:demo/calculator/views/numcal_view.dart';
import 'package:demo/icecream/views/icecream_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black, // Use this for calculator app
      // backgroundColor: Colors.white, // Use this for icecream app
      body: SafeArea(child: NumberCalculator()),
    );
  }
}
