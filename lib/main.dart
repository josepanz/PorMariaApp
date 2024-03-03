import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:por_maria_app/pages/drawer_pages/about_page.dart';
import 'package:por_maria_app/pages/drawer_pages/profile_page.dart';
import 'package:por_maria_app/pages/drawer_pages/settings_page.dart';
import 'package:por_maria_app/pages/drawer_pages/contacts_page.dart';
import 'package:por_maria_app/ui/sing_in/sing_in_page.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Por Maria App',
        theme: ThemeData(
          primaryColor: Colors.redAccent,
          bottomAppBarTheme: const BottomAppBarTheme(color: Colors.redAccent),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.redAccent),
          inputDecorationTheme: InputDecorationTheme(
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
        home: SingInPage(),
        routes: <String, WidgetBuilder>{
          SettingsPage.routeName: (context) => SettingsPage(),
          ProfilePage.routeName: (context) => ProfilePage(),
          ContactPage.routeName: (context) => ContactPage(),
          AboutPage.routeName: (context) => AboutPage()
        }
        //home: StartPage(),
        );
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


