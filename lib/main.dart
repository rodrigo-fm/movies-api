import 'package:flutter/material.dart';
import 'package:movies_api/modules/movie_api/presentation/views/popular_movies/bloc/popular_movies_bloc.dart';
import 'injection_container.dart' as di;

import 'modules/movie_api/presentation/views/movie_details/movie_details_view.dart';
import 'modules/movie_api/presentation/views/popular_movies/popular_movies_view.dart';
import 'shared/presentation/routes/routes.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Routes.popularMovies.route: (ctx) => PopularMoviesView(
              bloc: di.sl<PopularMoviesBloc>(),
            ),
        Routes.movieDetails.route: (ctx) => const MovieDetailsView(),
      },
      initialRoute: Routes.popularMovies.route,
    );
  }
}
