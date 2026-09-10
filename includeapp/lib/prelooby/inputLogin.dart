import 'package:flutter/material.dart';
//import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
//import 'package:includeapp/inicial.dart';
import 'package:includeapp/prelooby/gerador_senha.dart';
import 'package:includeapp/registrar/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_bubble/just_bubble.dart';

class Inputlogin extends StatefulWidget {
  const Inputlogin({super.key});

  @override
  State<Inputlogin> createState() => _InputloginState();
}

class _InputloginState extends State<Inputlogin> {
  final TextEditingController nomeUs = TextEditingController();
  bool mensagem = false;

  @override
  void dispose() {
    nomeUs.dispose();
    super.dispose();
  }

  Future<void> salvar() async {
    String nome = nomeUs.text.trim();

    if (nome.isEmpty) {
      setState(() {
        mensagem = true;
      });
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("usuario", nome);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => GeradorSenha(nome: nome)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("InputLogin", style: TextStyle(color: Colors.white)),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final telaWidth = MediaQuery.of(context).size.width;
            final telaHeight = MediaQuery.of(context).size.height;
            final telaPC = telaWidth > 600;

            final double pessoaWidth = telaPC ? telaWidth * 0.15 : telaWidth * 0.40;
            final double pessoaEsquerdo = telaPC ? telaWidth * 0.32 : telaWidth * 0.10;
            final double pessoaTop = telaPC ? telaHeight * 0.15 : telaHeight * 0.25;
            final double fontSizeBalao = telaPC ? telaWidth * 0.015 : telaWidth * 0.036;
            final double fontSizeElevated = telaPC ? telaWidth * 0.02 : telaWidth * 0.07;
            final double botaoPadding = telaPC ? telaWidth * 0.0075 : telaHeight * 0.015;
            final double botaoErro = telaPC ? telaWidth * 0.35 : telaWidth * 0.55;
            final double balaoTop = telaPC ? telaHeight * 0.07 : telaHeight * 0.15;
            final double balaoEsquerda = telaPC ? telaWidth * 0.48 : telaWidth * 0.45;
            final double balaoDireito = telaPC ? telaWidth * 0.355 : telaWidth * 0.115;

            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        left: pessoaEsquerdo,
                        top: pessoaTop,
                        child: Image.asset(
                          "assets/imagem/login/MeninoInputNome.png",
                          width: pessoaWidth,
                        ),
                      ),
                      Positioned(
                        left: balaoEsquerda,
                        top: balaoTop,
                        right: balaoDireito,
                        child: Bubble(
                          padding: const EdgeInsets.all(12),
                          color: Colors.white,
                          border: BubbleBorder(
                            tail: Tail.triangle(tailJoin: TailJoin.sharp),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            width: 2,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Meu nome é Rogério. Qual seu nome?",
                                style: TextStyle(fontSize: fontSizeBalao),
                              ),
                              TextField(
                                autofocus: true,
                                controller: nomeUs,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: fontSizeBalao),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (mensagem)
                  SizedBox(
                    width: botaoErro,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.red),
                        color: const Color.fromARGB(255, 255, 54, 54),
                      ),
                      child: const Text(
                        "Nome inválido",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  
                Padding(
                  padding: EdgeInsets.only(bottom: botaoPadding),
                  child: SizedBox(
                    width: telaWidth * 0.8,
                    height: telaHeight * 0.065,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: fontSizeElevated),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: botaoPadding),
                  child: SizedBox(
                    width: telaWidth * 0.8,
                    height: telaHeight * 0.065,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: salvar,
                      child: Text(
                        "Continuar",
                        style: TextStyle(fontSize: fontSizeElevated),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}