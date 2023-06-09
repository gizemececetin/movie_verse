import 'package:flutter/material.dart';
import 'package:movie_verse/data/providers/movide_provider.dart';
import 'package:movie_verse/domain/repositories/movie_repository.dart';
import 'package:movie_verse/domain/use_cases/get_movies_use_case.dart';
import 'package:movie_verse/presentation/screens/movie_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/presentation/theme/app_theme.dart';

import 'presentation/cubits/movie/movie_cubit.dart';

void main() {
  runApp(MoovieVerse());
}

class MoovieVerse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(),
      home: BlocProvider<MovieCubit>(
        create: (context) => MovieCubit(
            getMoviesUseCase:
                GetMoviesUseCase(MovieRepository(MovieProvider()))),
        child: MovieScreen(),
      ),
    );
  }
}
