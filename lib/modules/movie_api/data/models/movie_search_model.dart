import 'dart:convert';

import '../../domain/entities/movie_search_entity.dart';

class MovieSearchModel extends MovieSearchEntity {
  final int id;
  final String originalTitle;
  final double voteAverage;
  final String posterPath;

  MovieSearchModel({
    required this.id,
    required this.originalTitle,
    required this.voteAverage,
    required this.posterPath,
  }) : super(
          id: id,
          originalTitle: originalTitle,
          voteAverage: voteAverage,
          posterPath: posterPath,
        );

  factory MovieSearchModel.fromMap(Map<String, dynamic> map) {
    return MovieSearchModel(
      id: map['id'],
      originalTitle: map['original_title'],
      voteAverage: map['vote_average'],
      posterPath: map['poster_path'],
    );
  }

  static List<MovieSearchModel> fromMapList(Map<String, dynamic> maps) {
    final List<MovieSearchModel> resultado = [];
    maps['results'].forEach(
      (map) => resultado.add(MovieSearchModel.fromMap(map)),
    );
    return resultado;
  }

  static List<MovieSearchModel> fromJsonList(String jsonList) =>
      MovieSearchModel.fromMapList(json.decode(jsonList));
}
