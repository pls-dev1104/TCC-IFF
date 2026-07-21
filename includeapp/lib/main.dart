import 'package:flutter/material.dart';
import 'package:includeapp/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IncludeApp",
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF2563EB)),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
