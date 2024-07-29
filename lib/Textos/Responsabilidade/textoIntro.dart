import 'package:flutter/material.dart';
import 'package:idoso/main.dart';
import 'package:idoso/pages/final.dart';
import 'package:provider/provider.dart'; 
import 'package:idoso/Widget/corpoT.dart';
import 'package:idoso/Widget/ind.dart';

class SegurancaPage extends StatefulWidget {
  const SegurancaPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SegurancaPageState();
  }
}

class _SegurancaPageState extends State<SegurancaPage> {
  final PageController _stepFormController = PageController();
  int _page = 0;

  final List<Widget> _pagesList = [
    pageBody(Icons.public, 'Introdução',
        'A Internet é uma ferramenta incrível que nos permite se comunicar com pessoas ao redor do mundo, obter conhecimento e aproveitar diversas oportunidades.'),
    pageBody(Icons.security, 'Segurança',
        'É importante tomar cuidado e agir com responsabilidade ao navegar na Internet para garantir a segurança e o máximo proveito dessa ferramenta.'),
  ];

  void _changeStep(BuildContext context, bool nextPage) {
    if (_page < _pagesList.length - 1 && nextPage) {
      setState(() {
        _page++;
      });
      _stepFormController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else if (_page > 0 && !nextPage) {
      setState(() {
        _page--;
      });
      _stepFormController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else if (_page == _pagesList.length - 1 && nextPage) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GSI()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Internet com responsabilidade',
          style: TextStyle(
            fontSize: appState.fontSize,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: appState.isDarkMode ? Colors.black : const Color(0xFF29335C),
      ),
      body: PageView.builder(
        controller: _stepFormController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _pagesList[index];
        },
        itemCount: _pagesList.length,
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              _changeStep(context, false);
            },
            child: Text('Anterior', style: TextStyle(fontSize: appState.fontSize)),
          ),
          pageIndicador(_page == 0),
          pageIndicador(_page == 1),
          if (_page == _pagesList.length - 1)
            ElevatedButton(
              onPressed: () {
                _changeStep(context, true);
              },
              child: Text('Finalizar', style: TextStyle(fontSize: appState.fontSize)),
            )
          else
            ElevatedButton(
              onPressed: () {
                _changeStep(context, true);
              },
              child: Text('Próximo', style: TextStyle(fontSize: appState.fontSize)),
            ),
        ],
      ),
    );
  }
}
