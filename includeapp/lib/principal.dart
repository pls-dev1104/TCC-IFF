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
      body: Center(
        child: Column(
          children: [
          SizedBox(height: 200),
          
            Container(
              width: 300,
              height: 150,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black
                ),
              ),

            child: Column(
              children: [
                TextField(
                  controller: nomeUs,
                  decoration: InputDecoration(
                    labelText: "Digite o seu nome",
                    enabledBorder: OutlineInputBorder(   
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 70, 127, 224),
                    foregroundColor: Colors.white,
                    fixedSize: Size(255, 45)
                  ),
                  onPressed: salvar, 
                  child: Text("Cadastrar", style: TextStyle(fontSize: 16),)),
              ],
            ),
          ),
        ]
      )
    ),
  );
}
}
