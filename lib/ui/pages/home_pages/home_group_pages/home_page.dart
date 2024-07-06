import 'package:flutter/material.dart';
import 'package:por_maria_app/commons/HttpHandler.dart';
import 'package:por_maria_app/models/media_model.dart';
import 'package:por_maria_app/ui/pages/home_pages/home_group_pages/home_page_list_time.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Media> _media = <Media>[];
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    _loadJson();
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  _loadJson() async {
    var data = await HttpHandler().fetchMovies();
    if (_isMounted) {
      setState(() {
        _media.addAll(data);
      });
    }
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
