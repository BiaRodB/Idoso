import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:idoso/Widget/corpoT.dart';
//import 'package:idoso/pages/cadastroLogin/login.dart';
import 'package:idoso/pages/notif.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:idoso/pages/Inicial.dart';
import 'package:idoso/pages/cadastroLogin/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'Notificações',
        channelKey: 'channelKey',
        channelName: 'channelName',
        channelDescription: 'channelDescription'
      )
    ],
    channelGroups: [
      NotificationChannelGroup(channelGroupKey: 'Notificações', channelGroupName: 'channelGroupName')
    ]
  );

  bool isAllowedToSendNotification = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppState()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => TTSProvider()), // Adicione TTSProvider aqui
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    AwesomeNotifications().setListeners(
      onActionReceivedMethod: ControleNot.onActionReceivedMethod,
      onNotificationCreatedMethod: ControleNot.onNotificationCreatMethod,
      onDismissActionReceivedMethod: ControleNot.onDismissActionReceviedMethod,
      onNotificationDisplayedMethod: ControleNot.onNotificationDisplayedMethod,
    );

    scheduleDailyNotification();  // Schedule the daily notification
  }

  void scheduleDailyNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'channelKey',
        title: 'Daily Notification',
        body: 'This is your daily notification!',
        notificationLayout: NotificationLayout.Default
      ),
      schedule: NotificationCalendar(
        hour: 9,
        minute: 0,
        second: 0,
        repeats: true
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData(
            textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: appState.fontSize), // Aplica o tamanho da fonte
              bodyText2: TextStyle(fontSize: appState.fontSize),
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: appState.fontSize),
              bodyText2: TextStyle(fontSize: appState.fontSize),
            ),
          ),
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
          initialRoute: '/',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (_) => const SplashPage());
              case '/home':
                return MaterialPageRoute(builder: (_) => const HomePage());
              default:
                throw Exception('Invalid route');
            }
          },
        );
      },
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/imagem/idoso.jpeg', // Insira o caminho da imagem
        width: 2000,
        height: 1000,
      ),
      title: const Text('Bem-vindo'),
      backgroundColor: Colors.white, // Altere conforme necessário
      showLoader: true,
      loadingText: const Text("Loading..."),
      navigator: const HomePage(),
      durationInSeconds: 3,
    );
  }
}


class AppState extends ChangeNotifier {
  bool _isDarkMode = false;
  double _fontSize = 20.0;

  bool get isDarkMode => _isDarkMode;
  double get fontSize => _fontSize;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void increaseFontSize() {
    if (_fontSize < 50.0) { // Defina um tamanho máximo para a fonte
      _fontSize += 2.0;
      notifyListeners();
    }
  }

  void decreaseFontSize() {
    if (_fontSize > 20.0) { // Defina um tamanho mínimo para a fonte
      _fontSize -= 2.0;
      notifyListeners();
    }
  }
}

