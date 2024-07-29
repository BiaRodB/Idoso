import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:idoso/main.dart'; 

class TTSProvider with ChangeNotifier {
  final FlutterTts _flutterTts = FlutterTts();

  Future<void> speak(String text) async {
    await _flutterTts.setLanguage("pt-BR");
    await _flutterTts.setSpeechRate(0.5); // Ajuste a velocidade da fala conforme necessário
    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }
}

Widget pageBody(IconData iconData, String title, String description, [String? s]) {
  return Consumer2<AppState, TTSProvider>(
    builder: (context, appState, ttsProvider, child) {
      final isDarkMode = appState.isDarkMode;
      final textColor = isDarkMode ? Colors.white : Colors.black;
      final iconColor = isDarkMode ? Colors.white70 : Colors.grey;

      return Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 100, // Defina o tamanho do ícone conforme necessário
                color: iconColor,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: appState.fontSize + 10, // Aumente o tamanho da fonte do título
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: appState.fontSize, // Tamanho da fonte do corpo
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ttsProvider.speak(description);
                },
                child: Text('Ouvir Texto', style: TextStyle(fontSize: appState.fontSize)),
              ),
            ],
          ),
        ),
      );
    },
  );
}
