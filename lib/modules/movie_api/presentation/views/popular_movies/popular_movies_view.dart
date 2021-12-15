import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../widgets/popular_movies_bloc_widget.dart';
import 'bloc/popular_movies_bloc.dart';

class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes populares'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text('Filmes populares'),
          const SizedBox(height: 15),
          BlocProvider(
            create: (_) => sl<PopularMoviesBloc>(),
            child: const PopularMoviesBlocWidget(),
          ),
        ],
      ),
    );
  }
}
