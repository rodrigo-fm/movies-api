import 'dart:convert';

import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  final int id;
  final String originalTitle;
  final String overview;
  final double popularity;
  final double voteAverage;

  MovieDetailsModel({
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.voteAverage,
  }) : super(
          id: id,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          voteAverage: voteAverage,
        );

  factory MovieDetailsModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailsModel(
      id: map['id'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      voteAverage: map['vote_average'],
    );
  }

  factory MovieDetailsModel.fromJson(String source) =>
      MovieDetailsModel.fromMap(json.decode(source));
}
