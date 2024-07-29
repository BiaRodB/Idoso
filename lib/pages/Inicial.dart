import 'package:flutter/material.dart';
import 'package:idoso/Widget/barra.dart';
import 'package:idoso/main.dart';
import 'package:idoso/pages/menuCuid.dart';
import 'package:idoso/pages/menuResp.dart';
import 'package:idoso/pages/menuSeg.dart';
import 'package:idoso/pages/point_manager.dart';
import 'package:provider/provider.dart'; 


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtenha o estado atual do AppState
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bem-vindo!',
          style: TextStyle(
            fontSize: appState.fontSize, // Ajusta o tamanho da fonte
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: appState.isDarkMode ? Colors.black : const Color(0xFF29335C),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: appState.isDarkMode ? Colors.black : const Color(0xFF29335C),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Pontos:',
                    style: TextStyle(
                      fontSize: appState.fontSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  ValueListenableBuilder<int>(
                    valueListenable: PointManager.points,
                    builder: (context, points, child) {
                      return Text(
                        '$points',
                        style: TextStyle(
                          fontSize: appState.fontSize,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: appState.isDarkMode ? Colors.black : Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/imagem/idoso.jpeg',
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Iniciar o curso:',
                    style: TextStyle(
                      fontSize: appState.fontSize + 4, // Aumenta o tamanho da fonte para o título
                      fontWeight: FontWeight.bold,
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
                            builder: (context) => const MenuResp(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF29335C),
                        textStyle: TextStyle(fontSize: appState.fontSize + 4), // Aumenta o tamanho da fonte do botão
                        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      icon: const Icon(Icons.report, size: 50),
                      label: Text('Internet com responsabilidade', style: TextStyle(fontSize: appState.fontSize)),
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
                            builder: (context) => const MenuSeg(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF29335C),
                        textStyle: TextStyle(fontSize: appState.fontSize + 4),
                        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      icon: const Icon(Icons.security, size: 50),
                      label: Text('Segurança na internet', style: TextStyle(fontSize: appState.fontSize)),
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
                            builder: (context) => const MenuCuid(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF29335C),
                        textStyle: TextStyle(fontSize: appState.fontSize + 4),
                        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      icon: const Icon(Icons.health_and_safety_outlined, size: 50),
                      label: Text('Cuidados a serem tomados', style: TextStyle(fontSize: appState.fontSize)),
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
  }
}