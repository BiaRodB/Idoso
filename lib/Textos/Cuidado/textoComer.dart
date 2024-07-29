import 'package:flutter/material.dart';
import 'package:idoso/Widget/corpoT.dart';
import 'package:idoso/Widget/ind.dart';
import 'package:idoso/main.dart';
import 'package:idoso/pages/final.dart';
import 'package:provider/provider.dart';

class Comercio extends StatefulWidget {
  const Comercio({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ComercioState();
  }
}

class _ComercioState extends State<Comercio> {
  final PageController _stepFormController = PageController();
  int _page = 0;

  final List<Widget> _pagesList = [
    pageBody(Icons.public,
     'Introdução', 
     'A Internet é uma ferramenta incrível que nos permite se comunicar com pessoas ao redor do mundo, obter conhecimento e aproveitar diversas oportunidades. No entanto, é importante tomar cuidado e agir com responsabilidade ao navegar na Internet para garantir a segurança e o máximo proveito dessa ferramenta.'),
    pageBody(Icons.public,
     'Algumas dicas: ', 
      'Sua senha é igual à sua escova de dentes;'),
    pageBody(Icons.public,
     'Algumas dicas: ', 
      'Não divulgue seu nome completo, telefone e endereço. Mantenha o mínimo de informações possíveis em seu perfil;'),
      pageBody(Icons.public,
     'Algumas dicas: ', 
      'Desconfie de mensagens estranhas recebidas (por e-mail, WhatsApp, Facebook, Instagram, etc.). Mesmo que pareçam de conhecidos e amigos, elas podem ter vindo de contas falsas ou invadidas. '),
      pageBody(Icons.public,
     'Algumas dicas: ', 
        'Instituições financeiras nunca pedem confirmação de senhas e tampouco solicitam dados por e-mail, WhatsApp ou telefone. NUNQUINHA!;'),
      pageBody(Icons.public,
     'Algumas dicas: ', 
      'Nem tudo o que vemos, lemos ou ouvimos na Internet é verdade. Antes de curtir e de compartilhar uma notícia, uma foto ou um vídeo, procure saber mais sobre aquele fato pesquisando em fontes de informações variadas e confiáveis.'),
      pageBody(Icons.public,
     'Algumas dicas: ', 
      'Não deixe público na Internet o seu endereço, nem o local de trabalho de seus filhos e filhas, tampouco qual é a escola em que seus netos e netas estudam.'),
      pageBody(Icons.public,
     'Algumas dicas: ', 
      'Jamais publique, comente ou compartilhe conteúdo que desmoralize, humilhe ou constranja outras pessoas.'),
      pageBody(Icons.public,
     'Algumas dicas: ', 
      'Sempre desconfie de promoções fáceis e atrativas demais quando for comprar pela Internet.'),
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

