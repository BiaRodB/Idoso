import 'package:flutter/material.dart';
import 'package:idoso/Widget/barra.dart';
import 'package:idoso/main.dart';
import 'package:idoso/pages/Inicial.dart';
import 'package:idoso/pages/point_manager.dart';
import 'package:provider/provider.dart';


class GSI extends StatelessWidget {
  const GSI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      backgroundColor: appState.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text(
          "Parabéns!",
          style: TextStyle(
            fontSize: appState.fontSize,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: appState.isDarkMode ? Colors.black : const Color(0xFF29335C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Você concluiu com sucesso!",
              style: TextStyle(
                fontSize: appState.fontSize + 6, // Aumenta o tamanho da fonte para o título
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              child: Image.asset(
                'assets/imagem/idoso.jpeg',
                alignment: Alignment.topCenter,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('+5 pontos adicionados!'),
                    duration: Duration(seconds: 1),
                  ),
                );
                PointManager.addPoints(5);
                Navigator.pop(context, 5);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Text(
                "Concluir",
                style: TextStyle(fontSize: appState.fontSize, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarFb5(),
    );
  }
}