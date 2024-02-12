final String _imageUrlMedium = "https://image.tmdb.org/t/p/w300";
final String _imageUrlLarge = "https://image.tmdb.org/t/p/w500";

String getMediumPictureUrl(String path) => _imageUrlMedium + path;
String getLargePictureUrl(String path) => _imageUrlLarge + path;

final Map<int, String> _genreMap = {
  28: "Action",
  12: "Abenteuer",
  16: "Animation",
  35: "Komödie",
  80: "Krimi",
  99: "Dokumentarfilm",
  18: "Drama",
  10751: "Familie",
  14: "Fantasy",
  36: "Historie",
  27: "Horror",
  10402: "Musik",
  9648: "Mystery",
  10749: "Liebesfilm",
  878: "Science Fiction",
  10770: "TV-Film",
  53: "Thriller",
  10752: "Kriegsfilm",
  37: "Western",
};

List<String> genreToList(List<dynamic> genreIds) =>
    genreIds.map((e) => _genreMap[e] ?? "").toList();

String getGenreValues(List<dynamic> genreIds) {
  StringBuffer buffer = StringBuffer();
  buffer.writeAll(genreToList(genreIds), ", ");
  return buffer.toString();
}
