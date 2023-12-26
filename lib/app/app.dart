import 'package:demo/app/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo Application",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.raleway().fontFamily),
      home:
          const HomeView(), // This is the home view which will contain the code of home view [ This is like an component ]
    );
  }
}
