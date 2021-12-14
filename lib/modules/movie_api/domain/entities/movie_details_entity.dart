class MovieDetailsEntity {
  final int id;
  final String originalTitle;
  final String overview;
  final double popularity;
  final double voteAverage;

  MovieDetailsEntity({
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.voteAverage,
  });
}
