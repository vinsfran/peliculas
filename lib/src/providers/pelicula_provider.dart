import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaProvider {
  String _apiKey = '486bce279aef1afbb33c173be011f4dd';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<PeliculaModel>> getEnCines() async {
    return _getPeliculas('3/movie/now_playing');
  }

  Future<List<PeliculaModel>> getPopulares() async {
    return _getPeliculas('3/movie/popular');
  }

  Future<List<PeliculaModel>> _getPeliculas(String partUrl) async {
    final url = Uri.https(_url, partUrl, {
      'api_key': _apiKey,
      'language': _language,
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new PeliculasModel.fromJsonList(decodedData['results']);
    return peliculas.items;
  }
}
