class MovieSearchEntity {
  final int id;
  final String originalTitle;
  final double voteAverage;
  final String posterPath;

  MovieSearchEntity({
    required this.id,
    required this.originalTitle,
    required this.voteAverage,
    required this.posterPath,
  });

  String get posterURL => 'https://image.tmdb.org/t/p/w500$posterPath';
}
