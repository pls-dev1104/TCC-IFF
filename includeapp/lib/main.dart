import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:includeapp/configuracoes/firebase_options.dart';
import 'package:includeapp/prelooby/prelobby.dart';
import 'package:includeapp/principal/inicial.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

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
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Retorna apenas uma tela em branco no milissegundo de verificação
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(); 
          }
          // Se encontrou o usuário, vai para a Home
          if (snapshot.hasData) {
            return const Inicial(); 
          }
          // Caso contrário, vai para a tela inicial do App
          return const Prelobby(); 
        },
      ),
    );
  }
}