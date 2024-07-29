import 'package:flutter/material.dart';
import 'package:idoso/Textos/Cuidado/textoComer.dart';
import 'package:idoso/Textos/Cuidado/textoComp.dart';
import 'package:idoso/Textos/Cuidado/textoFakeN.dart';
import 'package:idoso/Textos/Cuidado/textoInterBank.dart';
import 'package:idoso/Textos/Cuidado/textoPriv.dart';
import 'package:idoso/Textos/Cuidado/textoRedSoc.dart';
import 'package:idoso/Textos/Cuidado/textoSmart.dart';
import 'package:idoso/main.dart';
import 'package:provider/provider.dart'; 
import 'package:idoso/Widget/barra.dart';

class MenuCuid extends StatelessWidget {
  const MenuCuid({Key? key}) : super(key: key);

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
                const SizedBox(height: 8), // Diminui a distância entre os elementos "Pontos" e "Iniciar o curso"
                Container(
                  color: isDarkMode ? Colors.black : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Iniciar Terceira Etapa :',
                        style: TextStyle(
                          fontSize: buttonFontSize + 10, // Aumente o tamanho da fonte do título
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
                                builder: (context) => Computador(),
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
                          label: Text('Computadores', style: TextStyle(color: buttonTextColor)),
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
                                builder: (context) => Smart(),
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
                          label: Text('Smartphones', style: TextStyle(color: buttonTextColor)),
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
                                builder: (context) => RedeSol(),
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
                          label: Text('Redes Sociais', style: TextStyle(color: buttonTextColor)),
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
                                builder: (context) => const Priv(),
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
                          label: Text('Privacidade', style: TextStyle(color: buttonTextColor)),
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
                                builder: (context) => const FakeN(),
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
                          label: Text('Boatos(Fake News)', style: TextStyle(color: buttonTextColor)),
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
                                builder: (context) => const Comercio(),
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
                          label: Text('Comercio eletrônico', style: TextStyle(color: buttonTextColor)),
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
                                builder: (context) => const InternetB(),
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
                          label: Text('Internet Banking', style: TextStyle(color: buttonTextColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const BottomNavBarFb5(), // Adiciona o BottomNavBarFb5()
        );
      },
    );
  }
}
