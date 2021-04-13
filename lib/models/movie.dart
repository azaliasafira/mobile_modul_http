class Movie {
  int id;
  String originalTitle;
  double voteAverage;
  String overview;
  List<int> genreIds;
  String releaseDate;
  String posterPath;

  Movie(this.id, this.originalTitle, this.voteAverage, this.overview,
      this.genreIds, this.posterPath);

  Movie.fromJson(Map<String, dynamic> Json) {
    this.id = Json['id'];
    this.originalTitle = Json['original_title'];
    this.voteAverage = Json['vote_average'] * 1.0;
    this.overview = Json['overview'];
    this.genreIds = Json['genre_ids'].cast<int>();
    this.releaseDate = Json['release_date'];
    this.posterPath = Json['poster_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.originalTitle;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['genre_ids'] = this.genreIds;
    data['release_date'] = this.releaseDate;
    data['poster_path'] = this.posterPath;
    return data;
  }
}
