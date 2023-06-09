/* import 'package:equatable/equatable.dart';

import '../../../domain/models/movie.dart';

// MovieState represents different states for movie data
abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {
  // Default state at the app start
}

class MovieLoading extends MovieState {
  // Loading state while fetching data
}

class MovieLoaded extends MovieState {
  /// Loaded movie data
  final List<Movie> movies; 

  const MovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieError extends MovieState {
  /// Error message
  final String errorMessage; 

  const MovieError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
 */

import 'dart:collection';
import 'package:equatable/equatable.dart';

import '../../../domain/models/movie.dart';

enum MovieStateError {
  none,
  generic,
  network,
}

class MovieState extends Equatable {
  final UnmodifiableListView<Movie> movies;
  final bool busy;
  final MovieStateError error;
  final String? errorMessage;

  MovieState({
    Iterable<Movie> movies = const <Movie>[],
    this.busy = false,
    this.error = MovieStateError.none,
    this.errorMessage,
  }) : movies = UnmodifiableListView(movies);

  MovieState copyWith({
    Iterable<Movie>? movies,
    bool? busy,
    MovieStateError? error,
    String? errorMessage,
  }) {
    return MovieState(
      movies: movies ?? this.movies,
      busy: busy ?? this.busy,
      error: error ?? this.error,
      errorMessage: error == MovieStateError.none
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        movies,
        busy,
        error,
        errorMessage,
      ];
}
