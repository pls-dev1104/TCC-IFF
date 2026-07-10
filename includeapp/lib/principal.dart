import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'inicial.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
TextEditingController nomeUs = TextEditingController();

 Future<void> salvar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("usuario", nomeUs.text);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => Inicial(nome: nomeUs.text)),
    );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("IncludeApp")),
      body: Center(child: 
        Column(children: [
          SizedBox(height: 20),
          
            SizedBox(
              width: 800,
              height: 60,
              child: TextField(
                controller: nomeUs,
                decoration: InputDecoration(
                  labelText: "Digitar o seu nome",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
            ),

            ElevatedButton(onPressed: salvar, child: Text("Cadastrar")),
          ]
        )
      ),
    );
  }
}
