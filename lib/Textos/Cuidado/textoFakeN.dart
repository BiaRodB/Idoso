import 'package:flutter/material.dart';
import 'package:idoso/Widget/corpoT.dart';
import 'package:idoso/Widget/ind.dart';
import 'package:idoso/main.dart';
import 'package:idoso/pages/final.dart';
import 'package:provider/provider.dart';

class FakeN extends StatefulWidget {
  const FakeN({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FakeNState();
  }
}

class _FakeNState extends State<FakeN> {
  final PageController _stepFormController = PageController();
  int _page = 0;

  final List<Widget> _pagesList = [
    pageBody(Icons.public,
     'Senha: ', 
     'As contas e senhas são como chaves que os sistemas usam para saber quem você é e permitir que você faça coisas neles. E muito importante proteger sua senha, pois ela é o segredo que confirma que você é o dono da sua conta.'),
    pageBody(Icons.public,
     'Senha: ', 
      'Portanto, é essencial tomar cuidado para proteger sua senha e evitar riscos ao usar a Internet.'),
    pageBody(Icons.public,
     'Riscos: ', 
      'Acessar sua conta de e-mail e ler, apagar e enviar e-mails em seu nome, também expõe você ao risco de ter seus contatos furtados, receber spam e códigos maliciosos, ter suas senhas solicitadas e a senha da sua conta alterada.'),
      pageBody(Icons.public,
     'Riscos: ', 
      'Acessar seu computador ou smartphone (celular) pode resultar na exclusão de arquivos, obtenção de informações sensíveis e instalação de códigos maliciosos, além de usá-lo para realizar ataques contra outros sistemas. '),
      pageBody(Icons.public,
     'Riscos: ', 
        'Acessar redes sociais pode levar à difamação, exploração da confiança de amigos/seguidores, envio de spam, boatos e códigos maliciosos, além de alterar configurações e trocar senhas para restringir o acesso à conta.'),
      pageBody(Icons.public,
     'Cuidados a serem tomados: ', 
      'Seja cuidadoso ao elaborar suas senhas'),
      pageBody(Icons.public,
     'Evite usar: ', 
      'Não deixe público na Internet o seu endereço, nem o local de trabalho de seus filhos e filhas, tampouco qual é a escola em que seus netos e netas estudam.'),
      pageBody(Icons.public,
     'Evite usar: ', 
      'dados que possam ser obtidos em redes sociais e páginas Web\n\nsequências de teclado, como “1qaz2wsx” e “QwerTAsdfG”'),
      pageBody(Icons.public,
     'Evite usar: ', 
     'palavras que fazem parte de listas publicamente conhecidas, como nomes de músicas,\n\n times de futebol, personagens de filmes e dicionários de diferentes idiomas'),

     pageBody(Icons.public,
     'Use: ', 
     'números aleatórios;\n\ngrande quantidade de caracteres\n\ndiferentes tipos de caracteres'),
    pageBody(Icons.public,
     'Seja cuidadoso ao usar suas senhas: ', 
      'Para proteger suas senhas, evite expô-las, certifique-se de não ser observado ao digitá-las, não as anote em locais visíveis e evite usá-las em computadores e dispositivos móveis de terceiros.'),
    pageBody(Icons.public,
     'Seja cuidadoso ao usar suas senhas:  ', 
      'Nunca compartilhe suas senhas com ninguém e esteja atento a chamadas telefônicas e e-mails que solicitem informações pessoais, como senhas, em nome de instituições, pois isso pode ser uma tentativa de fraude.'),
      pageBody(Icons.public,
     'Seja cuidadoso ao usar suas senhas: ', 
      'Certifique-se de usar conexões seguras sempre que o acesso envolver senhas \n\n Evite salvar as suas senhas no navegador Web\n\n Evite usar opções como “Lembre-se de mim” e “Continuar conectado” '),
      pageBody(Icons.public,
     'Seja cuidadoso ao usar suas senhas: ', 
      'Evite usar a mesma senha em todos os serviços que você utiliza, pois se um atacante conseguir uma senha, ele poderá acessar todas as outras contas onde a mesma senha for utilizada.'),
      pageBody(Icons.public,
     'Cuidados a serem tomados: ', 
      'Seja cuidadoso ao elaborar suas senhas'),
      pageBody(Icons.public,
     'Evite usar: ', 
      'Não deixe público na Internet o seu endereço, nem o local de trabalho de seus filhos e filhas, tampouco qual é a escola em que seus netos e netas estudam.'),
      pageBody(Icons.public,
     'Evite usar: ', 
      'dados que possam ser obtidos em redes sociais e páginas Web'),
      pageBody(Icons.public,
     'Evite usar: ', 
     'sequências de teclado, como “1qaz2wsx” e “QwerTAsdfG”'),
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

