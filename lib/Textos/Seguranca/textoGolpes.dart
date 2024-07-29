import 'package:flutter/material.dart';
import 'package:idoso/Widget/corpoT.dart';
import 'package:idoso/Widget/ind.dart';
import 'package:idoso/main.dart';
import 'package:idoso/pages/final.dart';
import 'package:provider/provider.dart';

class Golpes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GolpesState();
  }
}

class _GolpesState extends State<Golpes> {
  final PageController _stepFormController = PageController();
  int _page = 0;

  final List<Widget> _pagesList = [
    pageBody(Icons.public,
     '\n\nGolpes na Internet:', 
     '\n\nGolpistas estão concentrando seus esforços em enganar e persuadir os usuários, em vez de atacar diretamente os servidores de instituições financeiras ou comerciais.'),
    pageBody(Icons.public,
     '\n\nGolpes na Internet:', 
     '\n\nEles usam técnicas de engenharia social para enganar as pessoas e obter informações sensíveis ou levá-las a executar ações prejudiciais. '),
    pageBody(Icons.public,
     '\n\nGolpes na Internet:', 
     '\n\nCom esses dados, os golpistas podem realizar transações financeiras, enviar mensagens falsas, abrir contas bancárias ilegítimas e cometer outras atividades maliciosas.'),

    pageBody(Icons.public,
     '\n\nGolpes na Internet:', 
     '\n\nUm dos golpes mais comuns é o furto de identidade, em que alguém se faz passar por outra pessoa para obter benefícios indevidos.'),
    pageBody(Icons.public,
     '\n\nGolpes na Internet:', 
     '\n\nIsso pode acontecer tanto offline, como quando alguém abre uma conta bancária em seu nome, quanto online, quando alguém cria perfis falsos em redes sociais ou envia e-mails fingindo ser você.'),
    pageBody(Icons.public,
     '\n\nGolpes na Internet:', 
     '\n\nÉ importante proteger suas informações pessoais para evitar ser vítima desse tipo de golpe.'),

    pageBody(Icons.public,
    '\n\nGolpes na Internet:', 
    '\n\nOutro golpe comum é a fraude de antecipação de recursos, em que os golpistas convencem as pessoas a fornecer informações confidenciais ou fazer pagamentos adiantados, prometendo benefícios futuros que nunca se concretizam.'),
    pageBody(Icons.public,
    '\n\nGolpes na Internet:', 
    '\n\nExistem várias variações desse golpe, como loterias internacionais falsas, ofertas de crédito fácil e propostas de emprego tentadoras.'),

    pageBody(Icons.public,
    '\n\nGolpes na Internet:', 
    '\n\nPara se proteger desses golpes, é importante estar atento a sinais de que sua identidade está sendo usada indevidamente, como problemas com órgãos de proteção de crédito, e-mails retornados que você não enviou, acesso não autorizado a suas contas, transações financeiras suspeitas e comunicações sobre assuntos desconhecidos.'),
    pageBody(Icons.public,
    '\n\nGolpes na Internet:', 
    '\n\nAlém disso, é essencial ser cuidadoso ao usar e criar senhas e desconfiar de mensagens que oferecem quantias exorbitantes de dinheiro, solicitam sigilo e apresentam erros gramaticais.'),

    pageBody(Icons.public,
    '\n\nGolpes na Internet:', 
    '\n\nLembre-se de que nunca deve responder a essas mensagens, pois isso pode confirmar seu endereço de e-mail e torná-lo alvo de mais golpes.'),
    pageBody(Icons.public,
    '\n\nGolpes na Internet:', 
    '\n\nÉ importante questionar por que você foi escolhido para receber o benefício proposto e desconfiar de situações em que você precisa fazer um pagamento adiantado para receber um valor maior no futuro.'),
    pageBody(Icons.public,
    '\n\nGolpes na Internet:', 
    '\n\nConfie no ditado popular "Quando a esmola é demais, o santo desconfia" e fique atento a possíveis golpes.'),
 
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

