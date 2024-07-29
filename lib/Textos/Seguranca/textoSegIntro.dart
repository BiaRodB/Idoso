import 'package:flutter/material.dart';
import 'package:idoso/Widget/corpoT.dart';
import 'package:idoso/Widget/ind.dart';
import 'package:idoso/main.dart';
import 'package:idoso/pages/final.dart';
import 'package:provider/provider.dart';

class SegIntro extends StatefulWidget {
  const SegIntro({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SegIntroState();
  }
}

class _SegIntroState extends State<SegIntro> {
  final PageController _stepFormController = PageController();
  int _page = 0;

  final List<Widget> _pagesList = [
    pageBody(Icons.public,
     '\n\nSegurança na Internet: ', 
     '\n\nA Internet oferece muitas facilidades e oportunidades para as pessoas, como se comunicar com amigos e familiares, obter conhecimento, fazer compras e acessar serviços. '),
    pageBody(Icons.public,
     '\n\nPrincipais Riscos:  ', 
     '\n\nAcesso a conteúdo impróprio; \n\nContato com pessoas mal-intencionadas; \n\nFurto de identidade;'),
    pageBody(Icons.public,
     '\n\nPrincipais Riscos:  ', 
     '\n\nFurto e perda de dados;\n\nInvasão de privacidade;\n\nDivulgação de boatos (Fakenews); '),
    
    pageBody(Icons.public,
     '\n\nPrincipais Riscos:  ', 
     '\n\nDificuldade de exclusão de informações; \n\nDificuldade de detectar sentimentos;'),
    pageBody(Icons.public,
     '\n\nPrincipais Riscos:  ', 
     '\n\nDificuldade de manter sigilo; \n\nUso excessivo; \n\nPlágio e violação de direitos autorais.'),
 
    pageBody(Icons.public,
     '\n\nSegurança na Internet: ', 
     '\n\nÉ importante lembrar que a segurança na Internet requer uma abordagem preventiva e consciente.'),
    pageBody(Icons.public,
     '\n\nSegurança na Internet: ', 
     '\n\nAdotar práticas de segurança, estar atualizado sobre as ameaças e utilizar ferramentas de proteção são medidas essenciais para navegar na Internet com segurança.'),

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

