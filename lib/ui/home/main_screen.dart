import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:por_maria_app/ui/home/main_screen_cubit.dart';
import 'package:por_maria_app/ui/pages/drawer_pages/about_page.dart';
import 'package:por_maria_app/ui/pages/drawer_pages/profile_page.dart';
// import 'package:por_maria_app/ui/pages/drawer_pages/settings_page.dart';
import 'package:por_maria_app/ui/pages/drawer_pages/contacts_page.dart';
// import 'package:por_maria_app/ui/pages/home_pages/chat_group_pages/chats_list_page.dart';
import 'package:por_maria_app/ui/pages/home_pages/events_page.dart';
import 'package:por_maria_app/ui/pages/home_pages/home_group_pages/home_page.dart';
import 'package:por_maria_app/ui/pages/home_pages/musics_group_pages/musics_page.dart';
import 'package:por_maria_app/ui/home/chat/chat_view.dart';
import 'package:por_maria_app/ui/home/settings/settings_view.dart';

class MainScreenPage extends StatelessWidget {
  static const String routeName = "/main";
  // const MainScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     theme: Theme.of(context),
    //     debugShowCheckedModeBanner: false,
    //     home: StartPageWithTabs(),
    //     initialRoute: "/",
    //     routes: <String, WidgetBuilder>{
    //       SettingsView.routeName: (context) => SettingsView(),
    //       ProfilePage.routeName: (context) => ProfilePage(),
    //       ContactPage.routeName: (context) => ContactPage(),
    //       AboutPage.routeName: (context) => AboutPage()
    //     }
    //     //home: StartPage(),
    //   );
    return BlocProvider(
      create: (_) => MainScreenCubit(),
      child: BlocBuilder<MainScreenCubit, int>(
        builder: (context, state) {
          return StartPageWithTabs();
        },
      ),
    );
  }
}

class StartPageWithTabs extends StatefulWidget {
  @override
  _StartPageWithTabs createState() => _StartPageWithTabs();
}

class _StartPageWithTabs extends State<StartPageWithTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Drawer _getDrawer(BuildContext context) {
    var header = const DrawerHeader(child: Text("Menú"));
    var info = const AboutListTile(
        applicationName: "Por Maria App",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.star),
        icon: Icon(Icons.info),
        child: Text("Información App"));

    ListTile _getItem(Icon icon, String description, String route) {
      return ListTile(
          leading: icon,
          title: Text(description),
          onTap: () {
            setState(() {
              Navigator.of(context).pushReplacementNamed(route);
            });
          });
    }

    ListView listView = ListView(
      children: <Widget>[
        header,
        info,
        // _getItem(const Icon(Icons.info), "Acerca De", "/about"),
        _getItem(const Icon(Icons.person), "Perfil", "/profile"),
        _getItem(const Icon(Icons.settings), "Configuración", "/settings"),
        _getItem(const Icon(Icons.contacts), "Contactos", "/contacts"),
        // _getItem(const Icon(Icons.arrow_back), "Atras", "/main"),
      ],
    );

    return Drawer(child: listView);
  }

  @override
  void initState() {
    print('entro al _StartPageWithTabs initState');
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    print('entro al _StartPageWithTabs dispose');
    super.dispose();
  }

  void onTapDrawerTitle(String route) {
    setState(() {
      Navigator.of(context).pushNamed(route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Por Maria App"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22.0,
        ),
        //backgroundColor: Colors.redAccent,
        // bottom: tapBarTopBuild(),
      ),
      drawer: Drawer(
        child: _getDrawer(context),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          HomePage(),
          EventsPage(),
          ChatView(),
          const MusicsPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(tabController: _tabController),
    );
  }

  TabBar tapBarTopBuild() {
    return TabBar(
      tabs: const <Widget>[
        Tab(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        Tab(icon: Icon(Icons.event, color: Colors.white)),
        Tab(icon: Icon(Icons.chat, color: Colors.white)),
        Tab(icon: Icon(Icons.music_note, color: Colors.white))
      ],
      controller: _tabController,
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.redAccent,
        child: TabBar(
          tabs: const <Tab>[
            Tab(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(Icons.event, color: Colors.white),
            ),
            Tab(
              icon: Icon(
                Icons.chat,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.music_note,
                color: Colors.white,
              ),
            )
          ],
          controller: _tabController,
        ));
  }
}
