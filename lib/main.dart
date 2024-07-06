import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:por_maria_app/commons/Constants.dart';
import 'package:por_maria_app/firebase_options.dart';
// import 'package:por_maria_app/ui/pages/drawer_pages/about_page.dart';
// import 'package:por_maria_app/ui/pages/drawer_pages/profile_page.dart';
// import 'package:por_maria_app/ui/pages/drawer_pages/settings_page.dart';
// import 'package:por_maria_app/ui/pages/drawer_pages/contacts_page.dart';
import 'package:por_maria_app/ui/app_theme_cubit.dart';
// import 'package:por_maria_app/ui/sing_in/sign_in_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:por_maria_app/ui/home/main_screen.dart';
import 'package:por_maria_app/ui/home/settings/settings_view.dart';
import 'package:por_maria_app/ui/pages/drawer_pages/about_page.dart';
import 'package:por_maria_app/ui/pages/drawer_pages/contacts_page.dart';
import 'package:por_maria_app/ui/pages/drawer_pages/profile_page.dart';
import 'package:por_maria_app/ui/splash/splash_view.dart';
import 'package:por_maria_app/utils/dependencies.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting().then((_) => runApp(MyApp()));
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  static const String routeName = "/";

  final _streamChatClient = StreamChatClient(
    STREAM_CHAT_KEY,
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return MultiRepositoryProvider(
        providers: buildRepositories(_streamChatClient),
        child: BlocProvider(
            create: (context) => AppThemeCubit(context.read())..init(),
            child: BlocBuilder<AppThemeCubit, bool>(
              builder: (context, snapshot) {
                return MaterialApp(
                  title: 'Por Maria App',
                  theme: snapshot
                      ? ThemeData.dark()
                      : ThemeData(
                          primaryColor: Colors.redAccent,
                          bottomAppBarTheme:
                              const BottomAppBarTheme(color: Colors.redAccent),
                          bottomNavigationBarTheme:
                              const BottomNavigationBarThemeData(
                                  backgroundColor: Colors.redAccent),
                          inputDecorationTheme: const InputDecorationTheme(
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              hoverColor: Colors.white),
                          colorScheme: const ColorScheme(
                              brightness: Brightness.light,
                              primary: Colors.black,
                              onPrimary: Colors.purple,
                              secondary: Color.fromARGB(255, 204, 230, 248),
                              onSecondary: Color.fromARGB(255, 204, 230, 248),
                              error: Colors.red,
                              onError: Colors.red,
                              background: Colors.white,
                              onBackground: Color.fromARGB(255, 204, 230, 248),
                              surface: Colors.redAccent,
                              onSurface: Colors.black),
                        ),
                  debugShowCheckedModeBanner: false,
                  // home: StartPageWithTabs(),
                  home: SplashView(),
                  routes: <String, WidgetBuilder>{
                    MainScreenPage.routeName: (context) => MainScreenPage(),
                    SettingsView.routeName: (context) => SettingsView(),
                    ProfilePage.routeName: (context) => ProfilePage(),
                    ContactPage.routeName: (context) => ContactPage(),
                    AboutPage.routeName: (context) => AboutPage()
                  },
                  builder: (context, child) {
                    return StreamChat(client: _streamChatClient, child: child);
                  },
                  //home: StartPage(),
                );
              },
            )));
  }
}

// class StartPage extends StatefulWidget {
//   @override
//   _StartPageState createState() => _StartPageState();
// }

// class _StartPageState extends State<StartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Por Maria App'),
//         backgroundColor: Colors.grey[300],
//       ),
//       backgroundColor: Colors.blueGrey[300],
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const SizedBox(height: 12.0),
//             ElevatedButton(
//               child: const Text('Eventos'),
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => EventsPage()),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
