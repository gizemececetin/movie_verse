/* class Movie {
  String id;
  String title;
  String year;
  List<String> genres;
  List<int> ratings;
  String poster;
  String contentRating;
  String duration;
  DateTime releaseDate;
  double averageRating;
  String originalTitle;
  String storyline;
  List<String> actors;
  String imdbRating;
  String posterUrl;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.genres,
    required this.ratings,
    required this.poster,
    required this.contentRating,
    required this.duration,
    required this.releaseDate,
    required this.averageRating,
    required this.originalTitle,
    required this.storyline,
    required this.actors,
    required this.imdbRating,
    required this.posterUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      genres: List<String>.from(json['genres']),
      ratings: List<int>.from(json['ratings']),
      poster: json['poster'],
      contentRating: json['contentRating'],
      duration: json['duration'],
      releaseDate: DateTime.parse(json['releaseDate']),
      averageRating: json['averageRating'],
      originalTitle: json['originalTitle'],
      storyline: json['storyline'],
      actors: List<String>.from(json['actors']),
      imdbRating: json['imdbRating'],
      posterUrl: json['posterurl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'genres': genres,
      'ratings': ratings,
      'poster': poster,
      'contentRating': contentRating,
      'duration': duration,
      'releaseDate': releaseDate.toIso8601String(),
      'averageRating': averageRating,
      'originalTitle': originalTitle,
      'storyline': storyline,
      'actors': actors,
      'imdbRating': imdbRating,
      'posterurl': posterUrl,
    };
  }
}
 */

import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String? id; // Movie ID
  final String? title; // Movie title
  final String? year; // Movie year
  final List<String>? genres; // Movie genres
  final List<int>? ratings; // Movie ratings
  final String? poster; // Movie poster
  final String? contentRating; // Content rating
  final String? duration; // Movie duration
  final DateTime? releaseDate; // Release date
  final int? averageRating; // Average rating
  final String? originalTitle; // Original movie title
  final String? storyline; // Movie storyline
  final List<String>? actors; // Actors
  final dynamic imdbRating; // IMDB rating
  final String? posterUrl; // Poster URL

  const Movie({
    this.id,
    this.title,
    this.year,
    this.genres,
    this.ratings,
    this.poster,
    this.contentRating,
    this.duration,
    this.releaseDate,
    this.averageRating,
    this.originalTitle,
    this.storyline,
    this.actors,
    this.imdbRating,
    this.posterUrl,
  });
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      genres: List<String>.from(json['genres']),
      ratings: List<int>.from(json['ratings']),
      poster: json['poster'],
      contentRating: json['contentRating'],
      duration: json['duration'],
      releaseDate: DateTime.tryParse(json['releaseDate']),
      averageRating: json['averageRating'],
      originalTitle: json['originalTitle'],
      storyline: json['storyline'],
      actors: List<String>.from(json['actors']),
      imdbRating: json['imdbRating'],
      posterUrl: json['posterurl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'genres': genres,
      'ratings': ratings,
      'poster': poster,
      'contentRating': contentRating,
      'duration': duration,
      'releaseDate': releaseDate?.toIso8601String(),
      'averageRating': averageRating,
      'originalTitle': originalTitle,
      'storyline': storyline,
      'actors': actors,
      'imdbRating': imdbRating,
      'posterurl': posterUrl,
    };
  }

  double calculateAverageRating(List<int> ratings) {
    if (ratings.isEmpty) {
      return 0.0;
    }

    int sum = ratings.reduce((value, element) => value + element);
    return sum / ratings.length;
  }

  @override
  List<Object?> get props => [
        id,
        title,
        year,
        genres,
        ratings,
        poster,
        contentRating,
        duration,
        releaseDate,
        averageRating,
        originalTitle,
        storyline,
        actors,
        imdbRating,
        posterUrl,
      ];
}
