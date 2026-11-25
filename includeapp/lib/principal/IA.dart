// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

class IA extends StatefulWidget {
  final String nomeUsuario;

  const IA({super.key, required this.nomeUsuario});

  @override
  State<IA> createState() => _IAState();
}

class _IAState extends State<IA> {
  String get nomeUsuario => widget.nomeUsuario;

  final TextEditingController _controlador = TextEditingController();
  String _resposta = '';
  bool _carregando = false;

  final String _chaveAPI = const String.fromEnvironment('GEMINI_KEY');

  @override
  void initState() {
    super.initState();
    _resposta = 'Olá, $nomeUsuario! Como posso ajudar você a usar o aplicativo hoje?';
  }

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
Você é o Rogério, assistente de ajuda do aplicativo "IncludeApp", feito para ensinar pessoas idosas a usar o smartphone de forma simples e sem medo. Você é carinhoso e paciente, e nunca faz a pessoa se sentir boba por perguntar.

NOME DA PESSOA: $nomeUsuario
Comece TODA resposta e até a frase inicial chamando a pessoa pelo nome ($nomeUsuario), de forma carinhosa.JJ

REGRAS OBRIGATÓRIAS:
1. Responda em NO MÁXIMO 3 linhas curtas (o nome já conta como parte da primeira linha).
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
- Tutorial (ícone de vídeo): tela com vídeos que ensinam a usar o celular. Veja a seção Tutorial abaixo.
- Perfil (ícone de bonequinho): dados da conta e opções de sair ou excluir a conta.
- Dúvidas/Ajuda (ícone de um robô): abre o Assistente Rogério, com a finalidade de ajudar em qualquer dúvida sobre o app.

MENU LATERAL (Atalhos):
Aparece na tela de Perfil e abre ao arrastar o dedo da borda esquerda da tela para a direita. Tem 4 opções: Início, Níveis (lista de jogos), Perfil e Ajuda.

COMO FUNCIONAM OS JOGOS:
Os jogos são divididos em níveis, e cada nível tem fases. Em cada fase aparece a foto de uma tela de celular, uma pergunta e 4 botões de resposta. A barra azul no topo vai enchendo conforme a pessoa avança nas fases. A seta no canto de cima, à esquerda, volta para a tela anterior.
- Se a pessoa acertar, toca um som de acerto e ela passa para a próxima fase.
- Se errar, toca um som de erro e o botão escolhido fica vermelho. Ela pode tentar de novo com outro botão. Errar não tem problema, faz parte de aprender.
- Ao terminar o nível, aparece a tela "Parabéns! O nível foi concluído", com o botão "Próxima fase" (segue para o próximo nível) e o botão "Voltar ao início".

Nível 1, "Fazer ligações" (6 fases):
- Fase 1: na tela inicial do telefone, tocar no ícone de teclado com pontinhos (discar) para abrir a tela de digitar o número.
- Fase 2: depois de digitar o número, tocar no botão "Ligar" para fazer a chamada.
- Fase 3: tocar no ícone de menu (três tracinhos) para chegar à parte de contatos.
- Fase 4: no menu lateral, tocar no ícone de grupo de pessoas para abrir a lista de contatos.
- Fase 5: tocar no ícone de pessoa com sinal de mais (+) para criar um novo contato.
- Fase 6: preencher os dados da pessoa e tocar em "Salvar" para guardar o contato.

Nível 2, "Alarme" (6 fases):
- Fase 1: para criar um novo alarme, tocar no ícone de sinal de mais (+).
- Fase 2: para configurar a hora, tocar nos números da hora, escritos como "00 00".
- Fase 3: para colocar o nome do alarme, tocar na caixa "Nome do Alarme".
- Fase 4: depois de escolher a hora e o nome, tocar no botão "Ok" para criar o alarme.
- Fase 5: para ir ao cronômetro, tocar no ícone de relógio (um círculo com ponteiros) na parte de baixo da tela do relógio.
- Fase 6: para desativar um alarme, tocar no interruptor (botãozinho de ligar e desligar) que fica ao lado do horário do alarme.

Nível 3, "WhatsApp" (5 fases):
- Fase 1: para escolher com quem conversar, tocar em cima do nome da pessoa na lista de conversas.
- Fase 2: para escrever a resposta, tocar na caixa onde está escrito "Mensagem".
- Fase 3: para enviar a resposta, tocar no ícone de aviãozinho de papel.
- Fase 4: para fazer uma ligação, tocar no ícone de telefone (fone de telefone) no alto da conversa.
- Fase 5: para mandar um áudio, tocar no ícone de microfone.

Nível 4, "Conta Google" (7 fases):
- Fase 1: para criar a conta, tocar em "Criar conta".
- Fase 2: para escrever as informações, tocar sobre as caixas de preenchimento.
- Fase 3: para escrever as informações de novo, tocar sobre as caixas de preenchimento outra vez.
- Fase 4: para criar o endereço de e-mail, escolher uma das duas primeiras bolinhas (a 1ª ou a 2ª), que são as opções de endereço sugeridas.
- Fase 5: para criar a senha, tocar na caixa "Senha".
- Fase 6: para fazer uma pesquisa, tocar no ícone de lupa.
- Fase 7: para pesquisar usando a voz, tocar no ícone de microfone.

OUTROS NÍVEIS:
Existe também um Nível 5 sobre e-mail, mas você ainda não conhece as fases dele. Se perguntarem, diga com sinceridade que ainda não sabe explicar essa parte.

TUTORIAL:
- Tem o título "Tutorial" no alto da tela.
- Mostra uma lista de vídeos, um embaixo do outro. Cada vídeo tem uma frase curta escrita acima dele.
- Para assistir, a pessoa toca no botão de tocar (triângulo) no meio do vídeo. O vídeo não começa sozinho.
- Cada vídeo tem uma barra embaixo para pausar, avançar e um botão para abrir em tela cheia.
- Para ver os outros vídeos, a pessoa arrasta o dedo para cima na tela.
- Os vídeos precisam de internet para funcionar. Se o vídeo não aparecer, peça com carinho para a pessoa verificar a internet.
- Novos vídeos ainda serão adicionados. Se perguntarem por um vídeo que não está na lista, diga com sinceridade que ele ainda não existe.

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
        final textoGerado = dados['candidates']?[0]?['content']?['parts']?[0]?['text'];

        String respostaFinal = 'Não consegui entender. Pode perguntar de outro jeito?';

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
          _resposta = 'O assistente está muito ocupado agora. Tente de novo em alguns instantes.';
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
      appBar: appBarWidget(context, "Ajuda", ""),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        _carregando 
                        ? "assets/imagem/perfilRogerio/perfilRogerioPensando.png" 
                        : "assets/imagem/perfilRogerio/perfilRogerio.png",
                        width: 200
                      ),
                      
                      SizedBox(height: 40),

                      Text(
                        _resposta,
                        style: TextStyle(fontSize: 22, height: 1.4),
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