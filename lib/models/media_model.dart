import 'package:por_maria_app/utils/utils.dart';

class Media {
  int id;
  double views;
  String title;
  String imagePath;
  String backdropPath;
  String overview;
  String releaseDate;

  List<dynamic> genreIds;

  factory Media(Map jsonMap) {
    try {
      return Media.deserialize(jsonMap);
    } catch (ex) {
      throw ex;
    }
  }

  Media.deserialize(Map json)
      : id = json["id"].toInt(),
        views = json["vote_average"].toDouble(),
        title = json["title"],
        imagePath = json["poster_path"] ?? "",
        backdropPath = json["backdrop_path"] ?? "",
        overview = json["overview"],
        releaseDate = json["release_date"],
        genreIds = json["genre_ids"].toList();

  String getImageUrl() => getMediumPictureUrl(imagePath);
  String getBackdropUrl() => getLargePictureUrl(backdropPath);
  String getGenres() => getGenreValues(genreIds);
}
