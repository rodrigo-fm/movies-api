import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'modules/movie_api/data/datasources/movies_remote_datasource.dart';
import 'modules/movie_api/data/repositories/movies_repository.dart';
import 'modules/movie_api/domain/repositories/movies_repository_interface.dart';

import 'modules/movie_api/domain/usecases/get_movie_details_usecase.dart';
import 'modules/movie_api/domain/usecases/get_popular_movies_usecase.dart';
import 'modules/movie_api/presentation/views/popular_movies/bloc/popular_movies_bloc.dart';

final sl = GetIt.instance;

void init() {
  //! Modules - Movie Api
  // Bloc
  sl.registerFactory(
    () => PopularMoviesBloc(
      getPopularMovies: sl(),
    ),
  );

  // Usecases
  sl.registerLazySingleton(
    () => GetPopularMoviesUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => GetMovieDetailsUsecase(sl()),
  );

  // Repository
  sl.registerLazySingleton<IMoviesRepository>(
    () => MoviesRepository(sl()),
  );

  // Datasources
  sl.registerLazySingleton<IMoviesRemoteDatasource>(
    () => MoviesRemoteDatasource(sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
}
