import 'dart:convert';

import 'package:assessment/features/wallet/domain/entities/entite.dart';
import 'package:http/http.dart' as http;

class MovieService {
  static const String moviesApiUrl =
      'https://movie-recom-api.onrender.com'; // Replace with your actual API endpoint URL

  Future<List<Movie>> getMovies() async {

    List<Movie> moviesList = [];

    try {
      final response = await http.get(Uri.parse('$moviesApiUrl/movies'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['recommendations'];

        List<dynamic> jsonList = jsonDecode(data);
        moviesList = jsonList.map((json) => Movie.fromJson(json)).toList();

      } else {
        print('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred while fetching movies: $e');
    }

    return moviesList;
  }
}
