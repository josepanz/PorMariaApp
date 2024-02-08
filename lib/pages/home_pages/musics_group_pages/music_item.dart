import 'package:flutter/material.dart';
import 'package:por_maria_app/models/music_model.dart';

// class MusicItem extends StatelessWidget {
//   final MusicModel _music;
//   const MusicItem(this._music, {super.key});

// @override
// Widget build(BuildContext context) {
//   return ListTile(
//     leading: Container(
//       height: 47,
//       width: 47,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: const CircleAvatar(child: Icon(Icons.play_arrow)),
//     ),
//     title: Text(_music.name),
//     subtitle: Text(_music.artistName),
//   );
// }
// }

// ignore: must_be_immutable
class MusicItem extends StatefulWidget {
  MusicModel music;
  MusicItem(this.music, {super.key});

  @override
  _MusicItemsWithFavoriteState createState() => _MusicItemsWithFavoriteState();
}

class _MusicItemsWithFavoriteState extends State<MusicItem> {
  final saved = <MusicModel>{};

  @override
  Widget build(BuildContext context) {
    // final bool alreadySaved = saved.contains(widget.music);
    final bool alreadySaved = widget.music.isFavorite;
    return ListTile(
      //tileColor: const Color.fromARGB(255, 204, 230, 248),
      leading: Container(
        height: 47,
        width: 47,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        child: const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 204, 230, 248),
          child: Icon(Icons.play_arrow),
        ),
      ),
      title: Text(widget.music.name),
      subtitle: Text(widget.music.artistName),
      trailing: alreadySaved
          ? const Icon(Icons.favorite, color: Colors.redAccent)
          : const Icon(Icons.favorite_border, color: Colors.redAccent),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            saved.remove(widget.music);
            widget.music.isFavorite = false;
          } else {
            saved.add(widget.music);
            widget.music.isFavorite = true;
          }
        });
      },
    );
  }
}
