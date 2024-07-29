import 'package:flutter/material.dart';
import 'package:idoso/main.dart';
import 'package:provider/provider.dart'; 
import 'package:idoso/Textos/Responsabilidade/textoDicas.dart';
import 'package:idoso/Textos/Responsabilidade/textoIntro.dart';
import 'package:idoso/Widget/barra.dart';
import 'package:idoso/pages/Inicial.dart';

final GlobalKey<_MenuRespState> menuRespKey = GlobalKey<_MenuRespState>();

class MenuResp extends StatefulWidget {
  const MenuResp({Key? key}) : super(key: key);

  @override
  _MenuRespState createState() => _MenuRespState();
}

class _MenuRespState extends State<MenuResp> {
  bool primeiroBotaoClicado = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        final isDarkMode = appState.isDarkMode;
        final textColor = isDarkMode ? Colors.white : Colors.black;
        final buttonTextColor = isDarkMode ? Colors.white : Colors.white;
        final buttonBackgroundColor = const Color(0xFF29335C);
        final buttonFontSize = appState.fontSize;
        final containerColor = isDarkMode ? Colors.black : Colors.white;
        final appBarColor = buttonBackgroundColor;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Bem-vindo!',
              style: TextStyle(
                fontSize: 20,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: appBarColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Container(
                  color: containerColor,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Iniciar Primeira Etapa:',
                        style: TextStyle(
                          fontSize: buttonFontSize + 10, // Ajuste o tamanho da fonte
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          onPressed: () {
                            setState(() {
                              primeiroBotaoClicado = true;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SegurancaPage(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: buttonTextColor,
                            backgroundColor: buttonBackgroundColor,
                            textStyle: TextStyle(fontSize: buttonFontSize),
                            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: Icon(Icons.report, color: buttonTextColor),
                          label: Text('Introdução', style: TextStyle(color: buttonTextColor)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SegurancaPageD(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: buttonTextColor,
                            backgroundColor: buttonBackgroundColor,
                            textStyle: TextStyle(fontSize: buttonFontSize),
                            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: Icon(Icons.report, color: buttonTextColor),
                          label: Text('Dicas', style: TextStyle(color: buttonTextColor)),
                        ),
                      ),
                      const SizedBox(height: 300),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(), // Navegação de volta para a HomePage
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: buttonTextColor,
                            backgroundColor: buttonBackgroundColor,
                            textStyle: TextStyle(fontSize: buttonFontSize),
                            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: Icon(Icons.home, color: buttonTextColor), // Ícone para Home
                          label: Text('HomePage', style: TextStyle(color: buttonTextColor)), // Texto do botão
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const BottomNavBarFb5(),
        );
      },
    );
  }
}
