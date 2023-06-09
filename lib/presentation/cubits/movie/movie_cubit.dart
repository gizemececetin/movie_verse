import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/get_movies_use_case.dart';
import 'movie_state.dart';

// MovieCubit manages the movie data and emits relevant states
class MovieCubit extends Cubit<MovieState> {
  final GetMoviesUseCase _getMoviesUseCase;

  MovieCubit({
    required GetMoviesUseCase getMoviesUseCase,
  })  : _getMoviesUseCase = getMoviesUseCase,
        super(
          MovieState(),
        );

  // Fetch movie data
  Future<void> getMovies() async {
    emit(
      state.copyWith(
        busy: true,
        error: MovieStateError.none,
      ),
    );
    try {
      final movies = await _getMoviesUseCase.execute();
      emit(
        state.copyWith(
          movies: movies,
          busy: false,
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          busy: false,
          error: MovieStateError.network,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}



/* import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/get_movies_use_case.dart';
import 'movie_state.dart';

// MovieCubit manages the movie data and emits relevant states
class MovieCubit extends Cubit<MovieState> {
  final GetMoviesUseCase getMoviesUseCase;

  MovieCubit(this.getMoviesUseCase) : super(MovieInitial());

  // Fetch movie data
  Future<void> getMovies() async {
    try {
      emit(MovieLoading());
      final movies = await getMoviesUseCase.execute();
      emit(MovieLoaded(movies));
    } catch (e) {
      emit(const MovieError('Failed to load movies.'));
    }
  }
} */
