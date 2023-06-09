

import '../models/movie.dart';
import '../repositories/movie_repository.dart';

class GetMoviesUseCase {
  final MovieRepository movieRepository;

  GetMoviesUseCase(this.movieRepository);

  Future<List<Movie>> execute() {
    return movieRepository.getMovies();
  }
}