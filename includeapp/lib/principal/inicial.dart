import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

class Inicial extends StatefulWidget {

  const Inicial({super.key});

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {

  String nomeUsuario = '';

  @override
  void initState() {
    super.initState();
    _carregarNomeUsuario(); // Busca o nome assim que a tela abre
  }

  Future<void> _carregarNomeUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Pega a string salva na chave "usuario" ou usa "Visitante" como padrão se for nulo
      nomeUsuario = prefs.getString("usuario") ?? "Visitante"; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Text("Bem-vindo,$nomeUsuario !", style: const TextStyle(fontSize: 22)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildLevelButton(
                            title: "Nível 0",
                            subtitle: "Apps básicos do celular",
                            onPressed: () {},
                          ),
                          const SizedBox(height: 30),
                          _buildLevelButton(
                            title: "Nível 1",
                            subtitle: "Conversar e Instalar",
                            onPressed: () {},
                          ),
                          const SizedBox(height: 30),
                          _buildLevelButton(
                            title: "Nível 2",
                            subtitle: "Navegar e Participar",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        onPressed: () {
                          alertDialogAjuda(context);
                        },
                        child: const Icon(Icons.live_help_outlined, size: 50),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Ajuda?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildLevelButton({
    required String title,
    required String subtitle,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 200,
      height: 180,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(subtitle, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}