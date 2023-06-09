import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/movie.dart';
import '../cubits/movie/movie_cubit.dart';
import '../cubits/movie/movie_state.dart';
import 'movie_detail_screen.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Screen'),
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          return _buildContent(context, state);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<MovieCubit>().getMovies();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildContent(BuildContext context, MovieState state) {
    if (state.busy) {
      return _buildLoadingIndicator();
    } else if (state.error != MovieStateError.none) {
      return _buildErrorText(state.errorMessage);
    } else {
      final movies = state.movies;

      if (movies.isEmpty) {
        return _buildNoMoviesText();
      }

      return _buildMoviesGrid(context, movies);
    }
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorText(String? errorMessage) {
    return Center(
      child: Text('Error: ${errorMessage ?? 'Unknown error'}'),
    );
  }

  Widget _buildNoMoviesText() {
    return Center(
      child: Text('No movies available.'),
    );
  }

  Widget _buildMoviesGrid(BuildContext context, List<Movie> movies) {
    return GridView.builder(
      padding: EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final Movie movie = movies[index];
        return GestureDetector(
          onTap: () {
            _navigateToMovieDetails(context, movie);
          },
          child: GridTile(
            child: Image.network(movie.posterUrl!, fit: BoxFit.cover),
            footer: GridTileBar(
              backgroundColor: Colors.black45,
              title: Text(
                movie.title!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              subtitle: Text(
                'Rating: ${movie.averageRating}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToMovieDetails(BuildContext context, Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailScreen(movie: movie),
      ),
    );
  }
}
