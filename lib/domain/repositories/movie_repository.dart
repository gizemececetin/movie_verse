
import '../../data/providers/movide_provider.dart';
import '../models/movie.dart';

class MovieRepository {
  final MovieProvider movieService;

  MovieRepository(this.movieService);

  Future<List<Movie>> getMovies() {
    return movieService.getMovies();
  }
}