import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import 'bloc/movie_details_bloc.dart';
import 'widgets/movie_details_bloc_widget.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int idFilme = args['id'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do filme'),
      ),
      body: BlocProvider(
        create: (_) => sl<MovieDetailsBloc>(),
        child: MovieDetailsBlocWidget(idFilme),
      ),
    );
  }
}
