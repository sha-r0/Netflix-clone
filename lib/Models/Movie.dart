class Movie{
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterpath;
  double voteAverage;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterpath,
    required this.voteAverage
});

  factory Movie.fromjson(Map<String , dynamic> json){
    return Movie(
        title: json["title"],
        backDropPath: json["backdrop_path"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterpath: json["poster_path"].toString(),
        voteAverage: json["vote_average"]
    );

  }

}