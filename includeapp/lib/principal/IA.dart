import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IA extends StatefulWidget {
  const IA({super.key});

  @override
  State<IA> createState() => _IAState();
}

class _IAState extends State<IA> {
  final TextEditingController _controlador = TextEditingController();
  String _resposta = 'Olá! Como posso ajudar você a usar o aplicativo hoje?';
  bool _carregando = false;

  // Cole aqui a chave da AP
  final String _chaveAPI = const String.fromEnvironment('GEMINI_KEY');

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  Future<void> _perguntar(String pergunta) async {
    if (pergunta.trim().isEmpty) return;

    setState(() {
      _carregando = true;
      _resposta = 'Um momento, estou verificando...';
    });

    final endereco = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-3.1-flash-lite:generateContent',
    );

    try {
      final retorno = await http
          .post(
            endereco,
            headers: {
              'Content-Type': 'application/json',
              'x-goog-api-key': _chaveAPI,
            },
            body: jsonEncode({
              'systemInstruction': {
                'parts': [
                  {
                    'text': '''
Você é a assistente de ajuda do aplicativo "IncludeApp", feito para ensinar pessoas idosas a usar o smartphone de forma simples e sem medo. Você é carinhosa e paciente, e nunca faz a pessoa se sentir boba por perguntar.

REGRAS OBRIGATÓRIAS:
1. Responda em NO MÁXIMO 3 linhas curtas.
2. Use palavras simples do dia a dia. Evite termos em inglês e termos técnicos.
3. Explique um passo de cada vez, dizendo qual botão apertar e como ele é.
4. NUNCA mostre código, símbolos técnicos ou explique como o app foi programado.
5. Se perguntarem algo fora do app, diga com carinho que você só ajuda a usar o IncludeApp.
6. Se não souber ou se a função ainda não existir, diga isso com sinceridade. Nunca invente botões ou funções.

SOBRE O APP:
O IncludeApp ensina a mexer no celular por meio de quizzes (jogos de perguntas e respostas), com fotos de telas reais de celular.

BOTÕES NA PARTE DE BAIXO DA TELA:
- Inicial (ícone de casa): tela de boas-vindas com o nome da pessoa. No canto de cima, à direita, há uma medalha que abre o Ranking.
- Jogos (ícone de controle): mostra os níveis dos jogos.
- Tutorial (ícone de vídeo): vídeos de ensino. Ainda está em desenvolvimento.
- Perfil (ícone de bonequinho): dados da conta e opções de sair ou excluir a conta.
- Dúvidas/Ajuda (ícone de um robo): abre o Assistente Rogério, com a finalidade de ajudá-lo em qualquer dúvida sobre o app.

MENU LATERAL (Atalhos):
Aparece na tela de Perfil e abre ao arrastar o dedo da borda esquerda da tela para a direita. Tem 4 opções: Início, Níveis (lista de jogos), Perfil e Ajuda.

COMO FUNCIONAM OS JOGOS:
Os jogos são divididos em níveis, e cada nível tem fases. Em cada fase aparece a foto de uma tela de celular, uma pergunta e 4 botões de resposta. A barra azul no topo vai enchendo conforme a pessoa avança nas fases. A seta no canto de cima, à esquerda, volta para a tela anterior.
- Se a pessoa acertar, toca um som de acerto e ela passa para a próxima fase.
- Se errar, toca um som de erro e o botão escolhido fica vermelho. Ela pode tentar de novo com outro botão. Errar não tem problema, faz parte de aprender.
- Ao terminar o nível, aparece a tela "Parabéns! O nível foi concluído", com o botão "Próxima fase" (segue para o próximo nível) e o botão "Voltar ao início".
/
Nível 1, "Fazer ligações" (6 fases):
- Fase 1: na tela inicial do telefone, tocar no ícone de teclado com pontinhos (discar) para abrir a tela de digitar o número.
- Fase 2: depois de digitar o número, tocar no botão "Ligar" para fazer a chamada.
- Fase 3: tocar no ícone de menu (três tracinhos) para chegar à parte de contatos.
- Fase 4: no menu lateral, tocar no ícone de grupo de pessoas para abrir a lista de contatos.
- Fase 5: tocar no ícone de pessoa com sinal de mais (+) para criar um novo contato.
- Fase 6: preencher os dados da pessoa e tocar em "Salvar" para guardar o contato.
O Nível 2 ensina a mexer no alarme.

PERFIL:
- "Sair do perfil": sai da conta e volta para a tela de entrada. Pede confirmação antes.
- "Excluir conta": apaga a conta para sempre. Pede confirmação antes, então avise a pessoa para ter cuidado.
- "Informações Pessoais" e "Tema Escuro/Claro": ainda estão em desenvolvimento e não funcionam por enquanto.

DÚVIDA/AJUDA ATUAL:
Ao tocar em "DÚVIDAS?", a pessoa vê uma janela explicando que o app ensina a mexer no celular por quizzes, o que faz o botão de perfil e o que faz o ícone de menu.
'''
                  }
                ]
              },
              'generationConfig': {
                'maxOutputTokens': 300,
                'temperature': 0.5,
                'thinkingConfig': {'thinkingLevel': 'minimal'},
              },
              'contents': [
                {
                  'parts': [
                    {'text': pergunta}
                  ]
                }
              ]
            }),
          )
          .timeout(const Duration(seconds: 20));

      debugPrint('STATUS: ${retorno.statusCode}');
      debugPrint('BODY: ${retorno.body}');

      if (retorno.statusCode == 200) {
        final dados = jsonDecode(utf8.decode(retorno.bodyBytes));
        final textoGerado =
            dados['candidates']?[0]?['content']?['parts']?[0]?['text'];

        String respostaFinal =
            'Não consegui entender. Pode perguntar de outro jeito?';

        if (textoGerado is String && textoGerado.trim().isNotEmpty) {
          final linhas = textoGerado
              .trim()
              .split('\n')
              .where((linha) => linha.trim().isNotEmpty)
              .take(3);
          respostaFinal = linhas.join('\n');
        }

        if (!mounted) return;
        setState(() {
          _resposta = respostaFinal;
        });
      } else {
        if (!mounted) return;
        setState(() {
          _resposta = 'Erro ${retorno.statusCode}. Tente novamente.';
        });
      }
    } on TimeoutException {
      debugPrint('ERRO: tempo esgotado');
      if (!mounted) return;
      setState(() {
        _resposta = 'Demorou demais. Tente de novo.';
      });
    } catch (e) {
      debugPrint('ERRO: $e');
      if (!mounted) return;
      setState(() {
        _resposta = 'Sem conexão com a internet no momento.';
      });
    } finally {
      if (mounted) {
        setState(() {
          _carregando = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ajuda', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Image.asset("assets/imagem/perfilRogerio/perfilRogerio.png", width: 200),
                      Image.asset(
                        _carregando 
                        ? "assets/imagem/perfilRogerio/perfilRogerioPensando.png" 
                        : "assets/imagem/perfilRogerio/perfilRogerio.png",
                        width: 200
                      ),
                      
                      SizedBox(height: 60),

                      Text(
                        _resposta,
                        style: const TextStyle(fontSize: 22, height: 1.4),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ),
              ),
            ),
            TextField(
              controller: _controlador,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                hintText: 'Escreva sua dúvida aqui...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 17, 86, 143),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
                onPressed: _carregando
                    ? null
                    : () {
                        _perguntar(_controlador.text);
                        _controlador.clear();
                      },
                child: const Text('PERGUNTAR', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}