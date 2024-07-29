import 'package:flutter/material.dart';
import 'package:idoso/main.dart';
import 'package:provider/provider.dart'; // Para usar o AppState
import 'package:idoso/Textos/Seguranca/textoBackup.dart';
import 'package:idoso/Textos/Seguranca/textoCodigM.dart';
import 'package:idoso/Textos/Seguranca/textoGolpes.dart';
import 'package:idoso/Textos/Seguranca/textoSegIntro.dart';
import 'package:idoso/Textos/Seguranca/textoSenha.dart';
import 'package:idoso/Textos/Seguranca/textoVeri.dart';
import 'package:idoso/Widget/barra.dart';
import 'package:idoso/pages/Inicial.dart';

class MenuSeg extends StatelessWidget {
  const MenuSeg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        final isDarkMode = appState.isDarkMode;
        final textColor = isDarkMode ? Colors.white : Colors.black;
         final buttonTextColor = isDarkMode ? Colors.white : Colors.white;
        final buttonBackgroundColor = const Color(0xFF29335C);
        final buttonFontSize = appState.fontSize;

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
            backgroundColor: buttonBackgroundColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                Container(
                  color: isDarkMode ? Colors.black : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Iniciar Segunda Etapa :',
                        style: TextStyle(
                          fontSize: buttonFontSize + 10, // Aumenta o tamanho da fonte do título
                          fontWeight: FontWeight.bold,
                          color: textColor,
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
                                builder: (context) => SegIntro(),
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
                          label: Text('Segurança na Internet', style: TextStyle(color: buttonTextColor)),
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
                                builder: (context) => Golpes(),
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
                          icon: Icon(Icons.security, color: buttonTextColor),
                          label: Text('Golpes na Internet', style: TextStyle(color: buttonTextColor)),
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
                                builder: (context) => CodMal(),
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
                          icon: Icon(Icons.health_and_safety_outlined, color: buttonTextColor),
                          label: Text('Código maliciosos', style: TextStyle(color: buttonTextColor)),
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
                                builder: (context) => const Senha(),
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
                          label: Text('Senha', style: TextStyle(color: buttonTextColor)),
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
                                builder: (context) => const Backup(),
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
                          icon: Icon(Icons.security, color: buttonTextColor),
                          label: Text('Backup', style: TextStyle(color: buttonTextColor)),
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
                                builder: (context) => const Verificacao(),
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
                          icon: Icon(Icons.health_and_safety_outlined, color: buttonTextColor),
                          label: Text('Verificação de duas etapas', style: TextStyle(color: buttonTextColor)),
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
          bottomNavigationBar: const BottomNavBarFb5(), // Aqui você adiciona o BottomNavBarFb5()
        );
      },
    );
  }
}
