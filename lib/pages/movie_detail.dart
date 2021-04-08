import 'package:flutter/material.dart';
import 'package:list_mov2/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String path;
    if (movie.poster.Path != null) {
      String path;
      if (movie.posterPath != null) {
        path = imgPath + movie.posterPath;
      } else {
        path =
            'https://images.freeimages.com/images/large-previewsfleb/movie-clapboard-1184339.jpg';
      }
      double height = MediaQuery.of(context).size.height;
      return Scaffold(
        appBar: AppBar(
          title: Text(movie.originalTitle),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  height: height / 1.5,
                  child: Image.network(path),
                ),
                Container(
                  child: Text(movie.overview),
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
