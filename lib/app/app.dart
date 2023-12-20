import 'package:demo/views/home_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Demo Application",
      home:
          HomeView(), // This is the home view which will contain the code of home view [ This is like an component ]
    );
  }
}
