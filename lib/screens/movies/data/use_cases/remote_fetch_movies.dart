import 'dart:convert';

import 'package:http/http.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/use_cases/fetch_movies.dart';
import '../models/movie_model.dart';

class RemoteFetchMovies extends FetchMovies {
  @override
  Future<List<MovieEntity>> execute() async {
    try {
      final uri = Uri.parse('https://newghibliapi.herokuapp.com/films');
      final response = await Client().get(uri);
      final responseJson = jsonDecode(response.body);

      return responseJson
          .map<MovieEntity>((map) => MovieModel.fromMap(map).toEntity())
          .toList();
    } catch (e) {
      return [];
    }
  }
}
