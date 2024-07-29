import 'package:flutter/material.dart';
import 'package:idoso/main.dart';
import 'package:provider/provider.dart';
import 'package:idoso/Widget/barra.dart';
import 'package:url_launcher/url_launcher.dart';

class Conf extends StatelessWidget {
  const Conf({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações', style: TextStyle(fontSize: appState.fontSize)),
        backgroundColor: appState.isDarkMode ? Colors.grey[700] : const Color(0xFF29335C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row for font size buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.text_decrease),
                  onPressed: appState.decreaseFontSize,
                ),
                IconButton(
                  icon: const Icon(Icons.text_increase),
                  onPressed: appState.increaseFontSize,
                ),
              ],
            ),
            SizedBox(height: 16.0), // Espaço entre os botões e a lista
            // Column for theme toggle and links
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    appState.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    size: 30,
                  ),
                  
                  onPressed: appState.toggleTheme,
                ),
                SizedBox(height: 16.0),
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text('Instagram'),
                  onTap: () => _launchURL('https://www.instagram.com'),
                ),
              
                ListTile(
                  leading: const Icon(Icons.facebook),
                  title: const Text('Facebook'),
                  onTap: () => _launchURL('https://www.facebook.com'),
                ),
              
                ListTile(
                  leading: const Icon(Icons.code),
                  title: const Text('GitHub'),
                  onTap: () => _launchURL('https://www.github.com'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarFb5(),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
