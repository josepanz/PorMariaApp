import 'package:flutter/material.dart';
import 'package:por_maria_app/models/music_model.dart';
import 'package:por_maria_app/ui/pages/home_pages/musics_group_pages/music_list_page.dart';

import 'music_item.dart';

class MusicsPage extends StatelessWidget {
  const MusicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).appBarTheme.backgroundColor;
    // se crea la pagina de lista de canciones
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de Canciones",
          style: TextStyle(
            fontSize: 24,
            color: textColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        automaticallyImplyLeading: false,
        // backgroundColor: const Color.fromARGB(255, 204, 230, 248),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons
                  .search)), // TODO: implementar boton de busqueda de canciones
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      // TODO: Esto actualmente no funciona, la idea es que cuando marque favoritos se vean en el apartado de favoritos
                      final List<MusicModel> musicsList =
                          _buildList() as List<MusicModel>; // Lista de Musicas

                      // TODO: esto deberia de traer solo los que son favorito true, solo que eso no logra obtener del musicitem
                      final list = musicsList
                          .map((musicPage) => MusicItem(musicPage))
                          .where((element) => element.music
                              .isFavorite) //si se pone asi => !element.isFavorite si muestra, pero tiene que ser dinamico
                          .toList();

                      final tiles = list.map((item) {
                        return ListTile(
                          title: Text(item.music.name),
                          subtitle: Text(item.music.artistName),
                          leading: Container(
                            height: 47,
                            width: 47,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 204, 230, 248),
                              child: Icon(Icons.play_arrow),
                            ),
                          ),
                        );
                      });

                      // TODO: obtiene la lista de tiles de titulos favoritos, pero no funciona
                      final divided =
                          ListTile.divideTiles(context: context, tiles: tiles)
                              .toList();

                      // Crea la pagina de favoritos que si se crea la pagina pero no carga items.
                      // TODO: ver de solucionar para que se muestra los items. No funciona
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text("Favoritos"),
                          centerTitle: true,
                          titleTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                          backgroundColor: Colors.redAccent,
                        ),
                        body: ListView(
                          children: divided,
                        ),
                      );
                    },
                  ),
                );
              },
              icon: const Icon(Icons.list))
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 204, 230, 248),
      body: Container(
        padding: const EdgeInsets.only(bottom: 1.0),
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.white,
            child: (MusicList(_buildList())),
          ),
        ),
      ),
    );
  }
}

_buildList() {
  return <MusicModel>[
    MusicModel("Preparaté", "Por María", true),
    MusicModel("Tu Voz", "Por María", true),
    MusicModel("Con los Angeles", "Por María", false),
    MusicModel("Templo Vivo", "Por María", true),
    MusicModel("Incontrolable", "Por María", true),
    MusicModel("488 km de ida", "Por María", false),
    MusicModel("Danza de Avivamiento", "Por María", true),
    MusicModel("Un nuevo sol", "Por María", false),
    MusicModel("Dulce Doncella", "Por María", false),
    MusicModel("Parapapa", "Por María", false),
    MusicModel("Todos los cristianos salen a bailar", "Por María", true),
    MusicModel("Victoria en el desierto", "Por María", false),
    MusicModel("Mi corazón late late", "Por María", false),
    MusicModel("Himno a Cavevi", "Por María", false),
    MusicModel("Tiro liro liro", "Por María", false),
    MusicModel("Lázaro", "Por María", false),
  ];
}
