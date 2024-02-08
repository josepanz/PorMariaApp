import 'package:flutter/material.dart';
import 'package:por_maria_app/models/music_model.dart';
import 'package:por_maria_app/pages/home_pages/musics_group_pages/music_item.dart';

class MusicList extends StatelessWidget {
  final List<MusicModel> _musicsList;
  const MusicList(this._musicsList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 1),
      itemCount: _buildMusicList().length,
      itemBuilder: (context, index) {
        var musicItemList = _buildMusicList();
        var musicItem = musicItemList[index];
        return musicItem;
      },
    );
  }

  List<MusicItem> _buildMusicList() {
    return _musicsList.map((musicPage) => MusicItem(musicPage)).toList();
  }
}
