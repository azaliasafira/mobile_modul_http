import 'package:flutter/material.dart';
import 'package:list_mov2/models/movie.dart';
import 'package:list_mov2/models/constants.dart';
import 'package:list_mov2/models/date_utils.dart' as A;

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
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
                  child: Image.network(path)),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(movie.originalTitle,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Container(
                  child: Text(movie.overview, textAlign: TextAlign.center),
                  padding: EdgeInsets.only(left: 16, right: 16)),
              Container(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 280.0, 4.0),
                child: Text('Rate : ' + movie.voteAverage.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Wrap(
                children: <Widget>[
                  for (var genre in genresBy(movie.genreIds))
                    Chip(
                      label: Text(genre.name),
                    )
                ],
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Release Date: ' +
                      A.DateUtils.formatDate(movie.releaseDate, 'dd MMMM yyyy'),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
