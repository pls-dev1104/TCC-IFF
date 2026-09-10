import 'dart:math';
import 'package:flutter/material.dart';
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
  // 1. Limpa o nome recebido
  String nomeLimpo = nome
      .trim()
      .toLowerCase()
      .replaceAll(RegExp(r'\s+'), '.')
      .replaceAll(RegExp(r'[^a-z0-9.]'), '');

  // Se o usuário não digitou nada válido, usa 'usuario' como padrão
  if (nomeLimpo.isEmpty) nomeLimpo = 'usuario';

  // 2. Gera 4 dígitos numéricos aleatórios
  final random = Random();
  String quatroDigitos = '';
  for (int i = 0; i < 4; i++) {
    quatroDigitos += random.nextInt(10).toString();
  }

  // 3. Junta tudo e retorna o email final
  return '$nomeLimpo$quatroDigitos@includeapp.com';
}

  // Gera uma senha aleatória com no mínimo 6 dígitos numéricos
  String _gerarSenha(int tamanho) {
    final random = Random();
    String senha = '';
    for (int i = 0; i < tamanho; i++) {
      senha += random.nextInt(10).toString();
    }
    return senha;
  }

// Função para salvar no Firebase Authentication e redirecionar
  Future<void> _criarContaERedirecionar() async {
    try {
      // Chama o método signUp diretamente
      String? result = await AuthenticationHelper().signUp(
        email: emailGerado,
        password: senhaGerada,
      );

      if (!mounted) return;

      if (result == null) {
        // Sucesso! Redireciona para a Tela Inicial
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Inicial()), 
          (Route<dynamic> route) => false,
        );
      } else {
        // Falha no registro! Mostra o erro traduzido
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
      appBar: AppBar(
        title: const Text('Gerador de Credenciais'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          // Uso de SingleChildScrollView para evitar transbordo (overflow) em telas menores
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

                // Card com as Credenciais
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