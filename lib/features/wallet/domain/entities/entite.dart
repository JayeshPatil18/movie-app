import 'dart:convert';

class Movie {
  String posterUrl;
  final int movieId;
  final String title;
  final String tags;
  final String titleMain;
  final List<Genre> genres;
  final String overview;
  final double popularity;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.posterUrl,
    required this.movieId,
    required this.title,
    required this.tags,
    required this.titleMain,
    required this.genres,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    // Parse genres from the JSON string
    List<Genre> parsedGenres = [];
    dynamic genresJson = json['genres'];
    if (genresJson is String) {
      // If genresJson is a string, decode it into a list of maps
      List<dynamic> genreMaps = jsonDecode(genresJson);
      parsedGenres = genreMaps.map((genreMap) => Genre.fromJson(genreMap)).toList();
    } else if (genresJson is List<dynamic>) {
      // If genresJson is already a list, directly parse it
      parsedGenres = genresJson.map((genre) => Genre.fromJson(genre)).toList();
    }

    return Movie(
      posterUrl: "", // Replace with your poster URL logic
      movieId: json['movie_id'],
      title: json['title'],
      tags: json['tags'],
      titleMain: json['title_main'],
      genres: parsedGenres,
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}
