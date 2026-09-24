import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/jogos/nivel1/etapa2Chamada.dart';
import 'package:includeapp/prelooby/prelobby.dart';
import 'package:includeapp/registrar/authentication.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  
  Future<void> efetuarLogoff() async {
    // Apenas desloga do Firebase (onde seu nome, email e senha estão)
    await AuthenticationHelper().signOut();

    if (!mounted) return;

    // Limpa o histórico de navegação e volta pro começo
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Prelobby()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Pegando o nome atualizado salvo no Firebase Authentication
    final user = FirebaseAuth.instance.currentUser;
    final String nomeDoUsuario = user?.displayName ?? "Usuário";

    return Scaffold(
      appBar: appBarWidget(context, "Perfil", nomeDoUsuario),
      drawer: drawerFazer(context),
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
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.account_circle,
                                  size: bolaPerfil,
                                ),
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
                                      title: Text("Oi", style: TextStyle(color: Colors.black, fontSize: fontSizeTelaInferior),),
                                      leading: const Icon(Icons.abc_outlined, size: 25),
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Etapa2Chamada()));
                                      },
                                    ),
                    
                                    ListTile(
                                      title: Text("Oi", style: TextStyle(color: Colors.black, fontSize: fontSizeTelaInferior),),
                                      leading: const Icon(Icons.abc_outlined, size: 25,),
                                    ),

                                    ListTile(
                                      title: Text("Oi", style: TextStyle(color: Colors.black, fontSize: fontSizeTelaInferior),),
                                      leading: const Icon(Icons.abc_outlined, size: 25,),
                                    ),

                                    ListTile(
                                      title: Text("Oi", style: TextStyle(color: Colors.black, fontSize: fontSizeTelaInferior),),
                                      leading: const Icon(Icons.abc_outlined, size: 25,),
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Etapa2Chamada()));
                                      },
                                    ),
                                    
                                    ListTile(
                                      title: Text("Oi", style: TextStyle(color: Colors.black, fontSize: fontSizeTelaInferior),),
                                      leading: const Icon(Icons.abc_outlined, size: 25,),
                                    ),

                                    ListTile(
                                      title: Text("Oi", style: TextStyle(color: Colors.black, fontSize: fontSizeTelaInferior),),
                                      leading: const Icon(Icons.abc_outlined, size: 25,),
                                      onTap: () {},
                                    ),

                                    ListTile(
                                      title: Text("Oi", style: TextStyle(color: Colors.black, fontSize: fontSizeTelaInferior),),
                                      leading: const Icon(Icons.abc_outlined, size: 25,),
                                    ),

                                    ListTile(
                                      title: Text(
                                        "Configurações",
                                        style: TextStyle(color: Colors.black, fontSize: fontSizeTelaInferior),
                                      ),
                                      leading: const Icon(Icons.settings, size: 25),
                                      onTap: () {},
                                    ),

                                    ListTile(
                                      title: Text(
                                        "Sair do perfil",
                                        style: TextStyle(color: Colors.red, fontSize: fontSizeTelaInferior),
                                      ),
                                      leading: const Icon(Icons.logout, color: Colors.red, size: 25), // Ícone trocado para logout
                                      onTap: () {
                                        efetuarLogoff();
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