import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/principal/inicial.dart';
import 'package:includeapp/registrar/authentication.dart';
 

class GeradorSenha extends StatefulWidget {
  final String nome;

  const GeradorSenha({super.key, required this.nome});

  @override
  State<GeradorSenha> createState() => _GeradorSenhaState();
}

class _GeradorSenhaState extends State<GeradorSenha> {
  late String emailGerado;
  late String senhaGerada;

  @override
  void initState() {
    super.initState();
    emailGerado = _gerarEmail(widget.nome);
    senhaGerada = _gerarSenha(6); 
  }

String _gerarEmail(String nome) {
  // 1. Deixar o nome padrao fifa kkkkk
  String nomeLimpo = nome
      .trim()
      .toLowerCase()
      .replaceAll(RegExp(r'\s+'), '.')
      .replaceAll(RegExp(r'[^a-z0-9.]'), '');

  // 2. Gera numeros para diferenciar os emails
  final random = Random();
  String quatroDigitos = '';
  for (int i = 0; i < 4; i++) {
    quatroDigitos += random.nextInt(10).toString();
  }

  // 3. Junta tudo e da o email final
  return '$nomeLimpo$quatroDigitos@includeapp.com';
}

  // Gera uma senha de seis digitos no minimo
  String _gerarSenha(int tamanho) {
    final random = Random();
    String senha = '';
    for (int i = 0; i < tamanho; i++) {
      senha += random.nextInt(10).toString();
    }
    return senha;
  }

// Salvar no firebase
  Future<void> _criarContaERedirecionar() async {
    try {
      // Metodo signUp para salvar no authentication
      String? result = await AuthenticationHelper().signUp(
        email: emailGerado,
        password: senhaGerada,
        nome: widget.nome,
      );

      if (!mounted) return;

      if (result == null) {
        await FirebaseAuth.instance.currentUser?.reload();
        // Deu bom vai pro inicio
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => Inicial(),
          ), 
          (Route<dynamic> route) => false,
        );
      } else {
        // Deu ruim mostra os erro do firebase traduzido
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AuthenticationHelper().traduzirRetorno(result),
              style: const TextStyle(fontSize: 16),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Erro inesperado ao criar conta. Tente novamente.",
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.red,
        ),
      );
      debugPrint("Erro fatal ao tentar registrar: $e");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidgetMiniJogo(context, "Gerador de usuario"),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bem-vindo, ${widget.nome}!",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // Card 
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          "Sua conta foi gerada com sucesso: Guarde essas informações com bastante cuidado",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          leading: const Icon(Icons.email, color: Colors.blue),
                          title: const Text("Email Gerado",style: TextStyle(
                            fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                          ),
                          ),
                          subtitle: Text(
                            emailGerado,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.lock, color: Colors.blue),
                          title: const Text("Senha Sugerida (6 dígitos)", style: TextStyle(
                            fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 2.0,
                              color: Colors.black,
                          ),),
                          subtitle: Text(
                            senhaGerada,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 2.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                    ElevatedButton.icon(
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text("Criar Conta e Iniciar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  onPressed: _criarContaERedirecionar,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}