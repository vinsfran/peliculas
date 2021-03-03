import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaDetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PeliculaModel pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(child: Text(pelicula.title)),
    );
  }
}
