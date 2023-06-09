import 'package:dio/dio.dart';
import 'dart:convert';

import '../../domain/models/movie.dart';

/* class MovieProvider {
  final String? baseUrl;
  final Dio _dio;

  MovieProvider({this.baseUrl}) : _dio = Dio();

  Future<List<Movie>> fetchMovies() async {
    try {
      final response = await _dio.get(
          'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json');

      if (response.statusCode == 200) {
        final jsonList = response.data;
        final movies =
            response.data.map((json) => Movie.fromJson(json)).toList();
        return movies;
      } else {
        throw Exception('Failed to fetch movies');
      }
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }
}
 */

class MovieProvider {
  final Dio _dio;
  final String? baseUrl;

  MovieProvider({this.baseUrl}) : _dio = Dio();

  Future<List<Movie>> getMovies() async {
    try {
      // Make the API request
      final response = await _dio.get(
          'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json');

      // Check the response status
      if (response.statusCode == 200) {
        // Parse the JSON data
        final jsonData = json.decode(response.data) as List<dynamic>;

        // Map the JSON data to a list of Movie objects
        final movies = jsonData.map((item) => Movie.fromJson(item)).toList();

        return movies;
      } else {
        // Handle the error response
        throw Exception('Failed to fetch movies.');
      }
    } catch (e) {
      // Handle any exceptions
      throw Exception('Failed to fetch movies: $e');
    }
  }
}
