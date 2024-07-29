import 'package:flutter/material.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  double? screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth ??= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          MyTheme.largeVerticalPadding,
          const Text(
            "Hi, Daria!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          MyTheme.mediumVerticalPadding,
          Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.search, color: MyTheme.grey),
                Text(
                  "Seach our 1000+ courses",
                  style: TextStyle(color: MyTheme.grey),
                )
              ],
            ),
          )),
          SizedBox(
            height: screenWidth! / 2,
            child: Stack(alignment: Alignment.topCenter, children: [
              Column(
                children: [
                  const Spacer(flex: 1),
                  Expanded(
                      flex: 3,
                      child: Card(
                        color: MyTheme.catalogueCardColor,
                        child: Container(
                          width: double.infinity,
                        ),
                      ))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 0, 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Expanded(
                                    child: FittedBox(
                                      alignment: Alignment.centerLeft,
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Advance your \ncareer now",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Catalog",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                  const Expanded(
                      flex: 3,
                      child: Image(
                          alignment: Alignment.topCenter,
                          image: AssetImage('assets/catalog.png')))
                ],
              )
            ]),
          ),
          MyTheme.largeVerticalPadding,
          Row(
            children: const [
              Text("Trending courses",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Spacer(),
              Icon(Icons.tune)
            ],
          ),
          GridView.count(
            childAspectRatio: 0.75,
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              courseCard(
                  courseImage: const AssetImage('assets/tv.png'),
                  courseName: "How to become a YouTuber",
                  courseInfo: "Estimated 8 weeks",
                  coursePrice: "\$4.89"),
              courseCard(
                  courseImage: const AssetImage('assets/html.png'),
                  courseName: "Basic HTML for Dummies",
                  courseInfo: "Estimated 6 weeks",
                  coursePrice: "\$4.89"),
              courseCard(
                  courseImage: const AssetImage('assets/cryptocurrency.png'),
                  courseName: "Introduction to Bitcoin",
                  courseInfo: "Estimated 11 weeks",
                  coursePrice: "\$6.49"),
              courseCard(
                  courseImage: const AssetImage('assets/globe.png'),
                  courseName: "The Internet of Things",
                  courseInfo: "Estimated 10 weeks",
                  coursePrice: "\$6.49"),
            ],
          )
        ],
      ),
    );
  }

  Widget courseCard(
      {required AssetImage courseImage,
      required String courseName,
      required String courseInfo,
      required String coursePrice}) {
    return GestureDetector(
      onTap: () {
        // TODO: uncomment if you wish to navigato to course screen avaialble at FlutterBricks
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => CourseScreen(
        //             courseName: courseName,
        //             courseImage: courseImage,
        //             courseInfo: courseInfo,
        //             coursePrice: coursePrice,
        //           )),
        // );
      },
      child: Card(
          color: MyTheme.courseCardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: screenWidth! < 400 ? 3 : 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: courseImage,
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(courseName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(courseInfo,
                            style:
                                TextStyle(fontSize: 12, color: MyTheme.grey)),
                        MyTheme.smallVerticalPadding,
                        Text(
                          coursePrice,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}

class MyTheme {
  static Color get backgroundColor => const Color(0xFFF7F7F7);
  static Color get grey => const Color(0xFF999999);
  static Color get catalogueCardColor =>
      const Color(0xFFBAE5D4).withOpacity(0.5);
  static Color get catalogueButtonColor => const Color(0xFF29335C);
  static Color get courseCardColor => const Color(0xFFEDF1F1);
  static Color get progressColor => const Color(0xFF36F1CD);

  static Padding get largeVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 32.0));

  static Padding get mediumVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 16.0));

  static Padding get smallVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 8.0));

  static ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blueGrey,
      ).copyWith(
        cardTheme: const CardTheme(
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                catalogueButtonColor), // Button color
            foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white), // Text and icon color
          ),
        ),
      );
}



// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:easy_splash_screen/easy_splash_screen.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:idoso/pages/Inicial.dart';
// import 'package:idoso/pages/cadastroLogin/auth_provider.dart';
// import 'package:idoso/pages/cadastroLogin/login.dart';
// import 'package:idoso/pages/notif.dart';
// import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  

//   await AwesomeNotifications().initialize(
//     null, 
//     [
//       NotificationChannel(
//         channelGroupKey: 'Notificações',
//         channelKey: 'channelKey', 
//         channelName: 'channelName', 
//         channelDescription: 'channelDescription')
//     ],
//     channelGroups: [
//       NotificationChannelGroup(channelGroupKey: 'Notificações', channelGroupName: 'channelGroupName')
//     ]
//   );
//   bool isAllowedToSendNotification = await AwesomeNotifications().isNotificationAllowed();
//   if (!isAllowedToSendNotification) {
//     AwesomeNotifications().requestPermissionToSendNotifications();
//   }

// runApp(
//   DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => AppState()),
//         ChangeNotifierProvider(create: (context) => AuthProvider()), // Adicione o AuthProvider aqui
//       ],
//       child: const MyApp(),
//     ),
//   ),
// );
// }
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();

//     AwesomeNotifications().setListeners(
//       onActionReceivedMethod: ControleNot.onActionReceivedMethod,
//       onNotificationCreatedMethod: ControleNot.onNotificationCreatMethod,
//       onDismissActionReceivedMethod: ControleNot.onDismissActionReceviedMethod,
//       onNotificationDisplayedMethod: ControleNot.onNotificationDisplayedMethod,
//     );

//     scheduleDailyNotification();  // Schedule the daily notification
//   }

//   void scheduleDailyNotification() async {
//     await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: 10,
//         channelKey: 'channelKey',
//         title: 'Daily Notification',
//         body: 'This is your daily notification!',
//         notificationLayout: NotificationLayout.Default
//       ),
//       schedule: NotificationCalendar(
//         hour: 9,
//         minute: 0,
//         second: 0,
//         repeats: true
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppState>(
//       builder: (context, appState, child) {
//         return Consumer<AuthProvider>(
//           builder: (context, authProvider, child) {
//             return MaterialApp(
//               useInheritedMediaQuery: true,
//               locale: DevicePreview.locale(context),
//               builder: DevicePreview.appBuilder,
//               theme: ThemeData(
//                 textTheme: TextTheme(
//                   bodyText1: TextStyle(fontSize: appState.fontSize), // Aplica o tamanho da fonte
//                   bodyText2: TextStyle(fontSize: appState.fontSize),
//                 ),
//               ),
//               darkTheme: ThemeData.dark().copyWith(
//                 textTheme: TextTheme(
//                   bodyText1: TextStyle(fontSize: appState.fontSize),
//                   bodyText2: TextStyle(fontSize: appState.fontSize),
//                 ),
//               ),
//               themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
//               debugShowCheckedModeBanner: false,
//               home: authProvider.user == null ? const LoginPage() : const HomePage(),
//               initialRoute: '/',
//               onGenerateRoute: (settings) {
//                 switch (settings.name) {
//                   case '/':
//                     return MaterialPageRoute(builder: (_) => const SplashPage());
//                   case '/home':
//                     return MaterialPageRoute(builder: (_) => const HomePage());
//                   case '/login':
//                     return MaterialPageRoute(builder: (_) => const LoginPage());
//                   default:
//                     throw Exception('Invalid route');
//                 }
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class AppState extends ChangeNotifier {
//   bool _isDarkMode = false;
//   double _fontSize = 20.0;

//   bool get isDarkMode => _isDarkMode;
//   double get fontSize => _fontSize;

//   void toggleTheme() {
//     _isDarkMode = !_isDarkMode;
//     notifyListeners();
//   }

//   void increaseFontSize() {
//     if (_fontSize < 50.0) { // Defina um tamanho máximo para a fonte
//       _fontSize += 2.0;
//       notifyListeners();
//     }
//   }

//   void decreaseFontSize() {
//     if (_fontSize > 20.0) { // Defina um tamanho mínimo para a fonte
//       _fontSize -= 2.0;
//       notifyListeners();
//     }
//   }
// }

// class SplashPage extends StatelessWidget {
//   const SplashPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return EasySplashScreen(
//       logo: Image.asset(
//         'assets/imagem/idoso.jpeg', // Insira o caminho da imagem
//         width: 2000,
//         height: 1000,
//       ),
//       title: const Text('Bem-vindo'),
//       backgroundColor: Colors.white, // Altere conforme necessário
//       showLoader: true,
//       loadingText: const Text("Loading..."),
//       navigator: const HomePage(), // Navegar para HomePage após splash
//       durationInSeconds: 3,
//     );
//   }
// }
