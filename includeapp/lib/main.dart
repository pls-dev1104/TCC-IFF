import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:includeapp/banco_de_dados/firebase_options.dart';
import 'package:includeapp/home.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IncludeApp",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF2563EB)),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFF2563EB),
        ),
        listTileTheme: const ListTileThemeData(
          textColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,  
      home: const Home(),
    );
  }
}