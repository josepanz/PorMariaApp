import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:por_maria_app/commons/Constants.dart';
import 'package:por_maria_app/models/media_model.dart';

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

  Future<Map<String, dynamic>> userLogin(String userLoginData) async {
    // var uri = Uri.http("localhost:4000/", "user/login");
    var uri = Uri.parse("http://172.26.128.1:4000/user/login");

    // Crear un mapa a partir de la cadena JSON
    final Map<String, dynamic> data = json.decode(userLoginData);

    // Realizar la solicitud POST con el cuerpo JSON
    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );

    // Verificar el código de estado de la respuesta
    if (response.statusCode == 200) {
      // Parsear y retornar el modelo de usuario desde la respuesta
      return json.decode(response.body);
    } else {
      // Manejar el error (puedes lanzar una excepción o retornar un modelo de error)
      throw Exception('Error en la solicitud: ${response.statusCode}');
    }
  }
}
