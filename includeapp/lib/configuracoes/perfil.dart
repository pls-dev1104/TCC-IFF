// ignore_for_file: unnecessary_underscores

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/configuracoes/personalizar.dart';
import 'package:includeapp/prelooby/prelobby.dart';
import 'package:includeapp/registrar/authentication.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;
import 'package:cached_network_image/cached_network_image.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  Future<void> efetuarLogoff() async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sair da conta'),
        content: const Text(
          'Esta ação vai sair da sua conta.'
          'Deseja continuar?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Voltar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Sair', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmar == true) {
      await AuthenticationHelper().signOut();
      _finalizarLogoff();
    }
  }

  //==================

  Future<void> excluirConta() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Excluir conta'),
        content: const Text(
          'Esta ação é permanente e não pode ser desfeita.'
          'Todos os seus dados de login serão removidos. Deseja continuar?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Excluir', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmar == true) {
      await user.delete();
      _finalizarExclusao();
    }
  }

  void _finalizarExclusao() {
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Prelobby()),
      (route) => false,
    );
  }

  void _finalizarLogoff() {
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Prelobby()),
      (route) => false,
    );
  }

  final _supabase = Supabase.instance.client;
  static const String _bucketName = 'avatars';

  // ---- Avatar (StreamBuilder) ----
  Widget _buildAvatar({
    required double bolaPerfil,
    required User? user,
  }) {
    // Sem usuário logado: mostra o ícone padrão
    if (user == null) {
      return Container(
        width: bolaPerfil,
        height: bolaPerfil,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        clipBehavior: Clip.antiAlias,
        child: const Icon(Icons.person, size: 40, color: Colors.grey),
      );
    }

    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder: (context, snapshot) {
        final fileName = snapshot.data?.data()?['foto_perfil'] as String?;
        final hasImage = fileName != null && fileName.isNotEmpty;
        final url = hasImage
            ? _supabase.storage.from(_bucketName).getPublicUrl(fileName)
            : null;

        return Container(
          width: bolaPerfil,
          height: bolaPerfil,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
          clipBehavior: Clip.antiAlias,
          child: hasImage
              ? CachedNetworkImage(
                  imageUrl: url!,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (_, __, ___) =>
                      const Icon(Icons.person, size: 40, color: Colors.grey),
                )
              : const Icon(Icons.person, size: 40, color: Colors.grey),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Pegando o nome atualizado salvo no Firebase Authentication
    final user = FirebaseAuth.instance.currentUser;
    final String nomeDoUsuario = user?.displayName ?? "Usuário";

    return Scaffold(
      appBar: appBarWidget(context, "Perfil", nomeDoUsuario),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final telaWidth = MediaQuery.of(context).size.width;
            final telaHeight = MediaQuery.of(context).size.height;
            final telaPC = telaWidth > 600;

            final double telaSuperiorWidth;
            final double telaInferiorWidth;
            final double telaSuperiorHeight;
            final double telaInferiorHeight;
            final double telaLeftPessoa;
            final double telaTopPessoa;
            final double gapSuperiorInferior;
            final double gapInterSuperiorInferior;
            final double bolaPerfil;
            final double fontSizePerfil;
            final double fontSizeTelaInferior;

            if (telaPC) {
              gapSuperiorInferior = telaHeight * 0.02;
              gapInterSuperiorInferior = telaHeight * 0.05;
              telaSuperiorWidth = telaWidth * 0.40;
              telaInferiorWidth = telaWidth * 0.40;
              telaSuperiorHeight = telaHeight * 0.15;
              telaInferiorHeight = telaHeight * 0.70;
              telaLeftPessoa = telaWidth * 0.015;
              telaTopPessoa = telaSuperiorHeight * 0.60;
              bolaPerfil = telaHeight * 0.1;
              fontSizePerfil = 30;
              fontSizeTelaInferior = 30;
            } else {
              gapSuperiorInferior = telaHeight * 0.02;
              gapInterSuperiorInferior = telaHeight * 0.04;
              telaSuperiorWidth = telaWidth * 0.80;
              telaInferiorWidth = telaWidth * 0.80;
              telaSuperiorHeight = telaHeight * 0.125;
              telaInferiorHeight = telaHeight * 0.65;
              telaLeftPessoa = telaWidth * 0.03;
              telaTopPessoa = telaSuperiorHeight * 0.675;
              bolaPerfil = telaHeight * 0.075;
              fontSizePerfil = 20;
              fontSizeTelaInferior = 20;
            }

            return Center(
              child: SizedBox(
                width: telaWidth,
                child: Column(
                  children: [
                    SizedBox(height: gapSuperiorInferior),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: telaSuperiorWidth,
                              height: telaSuperiorHeight,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Informações do $nomeDoUsuario",
                                    style: TextStyle(
                                      fontSize: fontSizePerfil,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Positioned(
                              left: telaLeftPessoa,
                              top: telaTopPessoa,
                              child: _buildAvatar(
                                bolaPerfil: bolaPerfil,
                                user: user,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: gapInterSuperiorInferior),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: telaInferiorWidth,
                          height: telaInferiorHeight,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListView(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        "Personalizar",
                                        style: TextStyle(
                                          fontSize: fontSizeTelaInferior,
                                        ),
                                      ),
                                      leading: const Icon(Icons.edit, size: 25),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Personalizar(),
                                          ),
                                        );
                                      },
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Tema Escuro/Claro",
                                        style: TextStyle(
                                          fontSize: fontSizeTelaInferior,
                                        ),
                                      ),
                                      leading: const Icon(
                                        Icons.dark_mode,
                                        size: 25,
                                      ),
                                      onTap: trocarCores,
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Sair do perfil",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: fontSizeTelaInferior,
                                        ),
                                      ),
                                      leading: const Icon(
                                        Icons.logout,
                                        color: Colors.redAccent,
                                        size: 25,
                                      ),
                                      onTap: () {
                                        efetuarLogoff();
                                      },
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Excluir conta",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: fontSizeTelaInferior,
                                        ),
                                      ),
                                      leading: const Icon(
                                        Icons.delete_forever,
                                        color: Colors.redAccent,
                                        size: 25,
                                      ),
                                      onTap: () {
                                        excluirConta();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}