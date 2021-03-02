import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaProvider {
  String _apiKey = '486bce279aef1afbb33c173be011f4dd';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularesPage = 0;

  List<PeliculaModel> _populares = new List();

  final _popularesStreamController =
      StreamController<List<PeliculaModel>>.broadcast();

  Function(List<PeliculaModel>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<PeliculaModel>> get popularesStream =>
      _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<PeliculaModel>> getEnCines() async {
    return await _getPeliculas('3/movie/now_playing', 1);
  }

  Future<List<PeliculaModel>> getPopulares() async {
    _popularesPage++;

    final resp = await _getPeliculas('3/movie/popular', _popularesPage);
    _populares.addAll(resp);
    popularesSink(_populares);
    return resp;
  }

  Future<List<PeliculaModel>> _getPeliculas(String partUrl, int _page) async {
    final url = Uri.https(_url, partUrl,
        {'api_key': _apiKey, 'language': _language, 'page': _page.toString()});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new PeliculasModel.fromJsonList(decodedData['results']);
    return peliculas.items;
  }
}
