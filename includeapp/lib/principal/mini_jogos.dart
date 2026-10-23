import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/jogos/nivel0/etapa0Chamada.dart';
import 'package:includeapp/jogos/nivel1/etapa1Chamada.dart';
import 'package:includeapp/jogos/nivel2/etapa1Alarme.dart';

class MiniJogos extends StatefulWidget {
  const MiniJogos({super.key});

  @override
  State<MiniJogos> createState() => _MiniJogosState();
}

class _MiniJogosState extends State<MiniJogos> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String nomeUsuario = user?.displayName ?? "Usuário";

    return Scaffold(
      appBar: appBarWidget(context, "Níveis", nomeUsuario),
      drawer: drawerFazer(context),
      
      // SingleChildScrollView direto no body com padding
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20), // Espaçamento externo da tela
        child: Container(
          width: double.infinity, // Ocupa a largura disponível (agora funciona pois não tem Row)
          padding: const EdgeInsets.all(20), // Espaçamento interno do container
       
          child: GridView.count(
            crossAxisCount: 2, // 2 botões por linha
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 20, // Espaço vertical entre linhas
            crossAxisSpacing: 20, // Espaço horizontal entre colunas
            childAspectRatio: 1.0, // Deixa o botão quadrado (1.0 = largura igual a altura)
            
            children: [
              
              // Botão Nível 0
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Etapa0Chamada(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Nível 0",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Apps básicos do celular",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),

              // Botão Nível 1
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Etapa1Chamada(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Nível 1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Conversar e Instalar",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),

              // --- LINHA 2 ---

              // Botão Nível 2
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Etapa1Alarme(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Nível 2",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Navegar e Participar",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Nível 3",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Teste",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}