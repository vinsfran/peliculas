import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/pelicula_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final peliculaProvider = new PeliculaProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Peliculas en cines'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _swiperTarjetas(),
              _footer(context),
            ],
          ),
        ));
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculaProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CarSwiperWidget(
            peliculas: snapshot.data,
          );
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
    // ;
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text('Populares', style: Theme.of(context).textTheme.subtitle1),
          FutureBuilder(
            future: peliculaProvider.getPopulares(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              snapshot.data?.forEach((p) => print(p.title));

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
