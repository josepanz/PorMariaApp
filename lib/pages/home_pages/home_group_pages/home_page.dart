import 'package:flutter/material.dart';
import 'package:por_maria_app/commons/HttpHandler.dart';
import 'package:por_maria_app/models/media_model.dart';
import 'package:por_maria_app/pages/home_pages/home_group_pages/home_page_list_time.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Media> _media = <Media>[];

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  _loadJson() async {
    var data = await HttpHandler().fetchMovies();
    setState(() {
      _media.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    // return const Scaffold(
    //   backgroundColor: Color.fromARGB(255, 204, 230, 248),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [Icon(Icons.home, size: 160.0, color: Colors.white)],
    //     ),
    //   ),
    // );
    return Container(
        child: ListView.builder(
            itemCount: _media.length,
            itemBuilder: (BuildContext context, int index) {
              return HomePageListItem(_media[index]);
              // return Column(
              // children: <Widget>[Image.network(_media[index].getImageUrl())],
              // );
            }));
  }
}
