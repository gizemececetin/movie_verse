import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_verse/domain/models/movie.dart';
import 'package:movie_verse/domain/use_cases/get_movies_use_case.dart';
import 'package:movie_verse/presentation/cubits/movie/movie_cubit.dart';
import 'package:movie_verse/presentation/cubits/movie/movie_state.dart';

class MockGetMoviesUseCase extends Mock implements GetMoviesUseCase {}

void main() {
  group('MovieCubit', () {
    late MovieCubit movieCubit;
    late MockGetMoviesUseCase mockGetMoviesUseCase;

    setUp(() {
      mockGetMoviesUseCase = MockGetMoviesUseCase();
      movieCubit = MovieCubit(getMoviesUseCase: mockGetMoviesUseCase);
    });

    tearDown(() {
      movieCubit.close();
    });

    test('Initial state is correct', () {
      expect(movieCubit.state, MovieState());
    });

    test('getMovies success', () async {
      // Arrange
      final movies = [
        Movie(
          id: "1",
          title: "Game Night",
          year: "2018",
          genres: ["Action", "Comedy", "Crime"],
          ratings: [
            2,
            10,
            1,
            10,
            6,
            2,
            5,
            2,
            9,
            7,
            5,
            3,
            7,
            7,
            1,
            4,
            5,
            9,
            2,
            8,
            10,
            8,
            1,
            10,
            7,
            10,
            8,
            6,
            7,
            6
          ],
          poster:
              "MV5BMjQxMDE5NDg0NV5BMl5BanBnXkFtZTgwNTA5MDE2NDM@._V1_SY500_CR0,0,337,500_AL_.jpg",
          contentRating: "11",
          duration: "PT100M",
          releaseDate: DateTime(2018, 2, 28),
          averageRating: 0,
          originalTitle: "",
          storyline:
              "A group of friends who meet regularly for game nights find themselves trying to solve a murder mystery.",
          actors: ["Rachel McAdams", "Jesse Plemons", "Jason Bateman"],
          imdbRating: "",
          posterUrl:
              "https://images-na.ssl-images-amazon.com/images/M/MV5BMjQxMDE5NDg0NV5BMl5BanBnXkFtZTgwNTA5MDE2NDM@._V1_SY500_CR0,0,337,500_AL_.jpg",
        ),
        // Diğer filmleri buraya ekleyebilirsiniz.
      ];
      when(() => mockGetMoviesUseCase.execute()).thenAnswer(
        (_) async => movies,
      );

      // Act
      await movieCubit.getMovies();

      // Assert
      expect(movieCubit.state.movies, movies);
      expect(movieCubit.state.busy, false);
    });

    test('getMovies failure', () async {
      // Arrange
      final errorMessage = 'Failed to fetch movies';
      when(() => mockGetMoviesUseCase.execute())
          .thenThrow(Exception(errorMessage));

      // Act
      await movieCubit.getMovies();

      // Assert
      expect(movieCubit.state.error, MovieStateError.network);
      expect(movieCubit.state.errorMessage, errorMessage);
      expect(movieCubit.state.busy, false);
    });
  });
}
