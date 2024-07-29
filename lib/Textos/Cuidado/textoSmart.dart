import 'package:flutter/material.dart';
import 'package:idoso/Widget/corpoT.dart';
import 'package:idoso/Widget/ind.dart';
import 'package:idoso/main.dart';
import 'package:idoso/pages/final.dart';
import 'package:provider/provider.dart';

class Smart extends StatefulWidget {
  const Smart({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SmartState();
  }
}

class _SmartState extends State<Smart> {
  final PageController _stepFormController = PageController();
  int _page = 0;

  final List<Widget> _pagesList = [
    pageBody(Icons.public,
     '\n\nCódigo maliciosos:', 
     '\n\nSão programas desenvolvidos com o objetivo de causar danos e realizar atividades maliciosas nos dispositivos em que são executados.'),
    pageBody(Icons.public,
     '\n\nCódigo maliciosos:', 
     '\n\nEles são criados por pessoas com intenções malignas, como hackers e cibercriminosos.'),
    pageBody(Icons.public,
     '\n\nCódigo maliciosos:', 
     '\n\n Esses programas podem afetar uma ampla variedade de equipamentos, desde computadores e dispositivos móveis até modems, switches, roteadores e outros dispositivos de rede.'),

    pageBody(Icons.public,
     '\n\nCuidados a serem tomados: ', 
     '\n\nMantenha seus equipamentos atualizados; \n\n Use apenas programas originais; \n\n Tenha sempre as versões mais recentes dos programas instalados'),
    pageBody(Icons.public,
     '\n\nCuidados a serem tomados: ', 
     '\n\n Tenha sempre as versões mais recentes dos programas instalados'),

    pageBody(Icons.public,
     '\n\nCuidados a serem tomados: ', 
      '\n\nInstale todas as atualizações disponíveis, principalmente as de segurança;'),
    pageBody(Icons.public,
     '\n\nCuidados a serem tomados: ', 
      '\n\n Crie um disco de recuperação e tenha-o por perto no caso de emergências;'),
    pageBody(Icons.public,
     '\n\nCuidados a serem tomados: ', 
     '\n \n Instale um antivírus (antimalware), mantenha o ele atualizado, incluindo o arquivo de assinaturas.'),

    pageBody(Icons.public,
     '\n\nCuidados a serem tomados: ', 
      '\n\nConfigure o antivírus para verificar automaticamente toda e qualquer extensão de arquivo, arquivos anexados aos e-mails, obtidos pela Internet e os discos rígidos e as unidades removíveis;'),
    pageBody(Icons.public,
     '\n\nCuidados a serem tomados: ', 
     '\n\n Verifique sempre os arquivos recebidos, antes de abri-los ou executá-los'),

    pageBody(Icons.public,
     '\n\nCuidados a serem tomados: ', 
     '\n\nEvite executar simultaneamente diferentes antivírus: eles podem entrar em conflito, afetar o desempenho do equipamento e interferir na capacidade de detecção um do outro; '),
    pageBody(Icons.public,
     '\n\nCuidados a serem tomados: ', 
     '\n\n Para garantir a segurança do seu dispositivo, é fundamental utilizar um firewall pessoal. Certifique-se de ter um instalado e ativado.'),

    pageBody(Icons.public,
     '\n\nCuidados a serem tomados: ', 
     '\n\nAo instalar aplicativos, é crucial adotar medidas de segurança. Certifique-se de baixar aplicativos somente de fontes confiáveis e verifique se as permissões de instalação e execução são adequadas. \n\nPrefira aplicativos bem avaliados e populares, pois tendem a ser mais seguros e confiáveis. \n\nEssas precauções ajudam a proteger seu dispositivo contra malware e garantem uma experiência de uso mais segura.'),
    pageBody(Icons.public,
     '\n\nCuidados a serem tomados: ', 
     '\n\nPrefira aplicativos bem avaliados e populares, pois tendem a ser mais seguros e confiáveis.'),
    pageBody(Icons.public,
     '\n\nCuidados a serem tomados: ', 
     '\n\nEssas precauções ajudam a proteger seu dispositivo contra malware e garantem uma experiência de uso mais segura.'),

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

