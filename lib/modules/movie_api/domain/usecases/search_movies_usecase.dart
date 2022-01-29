import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failures_error.dart';
import '../entities/movie_search_entity.dart';
import '../enums/usecase_error_messages_enum.dart';
import '../repositories/movies_repository_interface.dart';

class SearchMoviesUsecase {
  final IMoviesRepository repository;

  SearchMoviesUsecase(this.repository);

  Future<Either<FailureError, List<MovieSearchEntity>>> call(
    String keyword,
  ) async {
    final resultado = await repository.searchMovie(keyword);

    return resultado.fold(
      (falha) => Left(falha),
      (filmes) {
        if (filmes.isEmpty) {
          return Left(GenericFailureError(
            UsecaseErrorEnum.nenhumFilmeEncontrado.message,
          ));
        }
        return Right(filmes);
      },
    );
  }
}
