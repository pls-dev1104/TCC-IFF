import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
import 'package:includeapp/configuracoes/firebase_options.dart';
import 'package:includeapp/prelooby/prelobby.dart';
import 'package:includeapp/principal/inicial.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Supabase.initialize(
    url: 'https://rutzlttmuncskuvqyrix.supabase.co',
    publishableKey: 'sb_publishable_c03tSXWgwqj9vBwSJG7iEA_qWde_iWO',
    accessToken: () async {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return null;
      return await user.getIdToken();
    },
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    temaNotifier.addListener(_onTemaMudou);
  }

  @override
  void dispose() {
    temaNotifier.removeListener(_onTemaMudou);
    super.dispose();
  }

  void _onTemaMudou() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = background == const Color(0xFF0F172A);

    return MaterialApp(
      title: "IncludeApp",
      theme: ThemeData(
        // ⬇️ isto faz textTheme / colorScheme mudarem entre claro e escuro
        brightness: isDark ? Brightness.dark : Brightness.light,
        appBarTheme: AppBarTheme(backgroundColor: appbar),
        // ⬇️ listTileTheme removido — não força mais textColor: Colors.white
        scaffoldBackgroundColor: background,
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold();
          }
          if (snapshot.hasData) {
            return const Inicial();
          }
          return const Prelobby();
        },
      ),
    );
  }
}
