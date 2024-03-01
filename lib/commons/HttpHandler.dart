import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:por_maria_app/commons/Constants.dart';
import 'package:por_maria_app/models/media_model.dart';
import 'package:por_maria_app/models/user_model.dart';

class HttpHandler {
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "es-Es";

  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    // return json.decode(response.body).toString();
    return json.decode(response.body);
  }

  // Future<String> fetchMovies() {
  Future<List<Media>> fetchMovies() {
    var uri = Uri.https(_baseUrl, "3/movie/popular",
        {'api_key': API_KEY, 'page': "1", 'language': _language});

    // return getJson(uri).then((value) => value.toString());
    return getJson(uri).then(
        (value) => value['results'].map<Media>((item) => Media(item)).toList());
  }

  Future<UserModel> getUserDate() {
    var uri = Uri.https(_baseUrl, "3/movie/popular",
        {'api_key': API_KEY, 'page': "1", 'language': _language});

    // return getJson(uri).then((value) => value.toString());
    return getJson(uri).then(
        (value) => value['results'].map<Media>((item) => Media(item)).toList());
  }
}
