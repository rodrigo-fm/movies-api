import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

import 'modules/movie_api/presentation/views/popular_movies/popular_movies_view.dart';

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
      home: const PopularMoviesView(),
    );
  }
}
