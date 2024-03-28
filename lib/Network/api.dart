import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/Models/Movie.dart';
import 'package:netflix/Network/keys.dart';

class Api {
  static const _trendingurl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Key.apikey}';

  static const _upcominggurl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Key.apikey}';

  static const _topratedurl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Key.apikey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingurl));

    if (response.statusCode == 200) {
      final decodedata = jsonDecode(response.body)["results"] as List;
      print("Data is loaded");
      return decodedata.map((e) => Movie.fromjson(e)).toList(); // Assuming 'results' contains the list of movies
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<List<Movie>> getTopratedMovies() async {
    final response = await http.get(Uri.parse(_topratedurl));

    if (response.statusCode == 200) {
      final decodedata = jsonDecode(response.body)["results"] as List;
      print("Data is loaded");
      return decodedata.map((e) => Movie.fromjson(e)).toList(); // Assuming 'results' contains the list of movies
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<List<Movie>> getupcomingMovies() async {
    final response = await http.get(Uri.parse(_upcominggurl));

    if (response.statusCode == 200) {
      final decodedata = jsonDecode(response.body)["results"] as List;
      print("Data is loaded");
      return decodedata.map((e) => Movie.fromjson(e)).toList(); // Assuming 'results' contains the list of movies
    } else {
      throw Exception('Failed to load trending movies');
    }
  }
}

