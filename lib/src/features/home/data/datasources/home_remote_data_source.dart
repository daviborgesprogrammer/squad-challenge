import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/restClient/rest_client.dart';
import '../models/movie_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieModel>> fetchMovies(String? title);
  Future<MovieModel> fetchMobie(String? id);

  factory HomeRemoteDataSource() => HomeRemoteDataSourceImpl();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final _restClient = GetIt.I<RestClient>();

  @override
  Future<List<MovieModel>> fetchMovies(String? title) async {
    try {
      final jsonResponse =
          '{"Search":[{"Title":"Rise of the Black Bat","Year":"2012","imdbID":"tt2205589","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMjMwMTQ2OTU2MF5BMl5BanBnXkFtZTcwMDI0OTU4OA@@._V1_SX300.jpg"},{"Title":"The Bat","Year":"1926","imdbID":"tt0016629","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BOGFiYWZmYjctNmZmZi00ZmQwLTlmMTUtODM1YjhkYjAwOWNkXkEyXkFqcGc@._V1_SX300.jpg"},{"Title":"Casey at the Bat","Year":"1946","imdbID":"tt0038399","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BZDliMmFiNDAtODdkYS00M2Q1LTgyNmUtNDJhZWIwNjMzZTYyXkEyXkFqcGdeQXVyMjk3NTUyOTc@._V1_SX300.jpg"},{"Title":"The Bat Man of Shanghai","Year":"2012","imdbID":"tt2273962","Type":"series","Poster":"https://m.media-amazon.com/images/M/MV5BZjY3MThlODgtODVhMS00MmM1LWE2NmEtNjQ1NGQyNjQxZDFkXkEyXkFqcGdeQXVyMTEyNzgwMDUw._V1_SX300.jpg"},{"Title":"The Golden Bat","Year":"1966","imdbID":"tt0167320","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BOGMzMGU3YzQtZWNhNC00ZDMyLWI0NzQtZTlmN2M1MmUwMWFkXkEyXkFqcGc@._V1_SX300.jpg"},{"Title":"The Sea Bat","Year":"1930","imdbID":"tt0021345","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BM2JmYjU3ODYtZWFhOS00ZWFhLWIwMWQtMWZmYTgyM2MwNjUxXkEyXkFqcGdeQXVyNDAzOTcxOTE@._V1_SX300.jpg"},{"Title":"Classic Albums: Meat Loaf - Bat Out of Hell","Year":"1999","imdbID":"tt0235298","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTg0OTI5NzAxNV5BMl5BanBnXkFtZTcwMzE2MTAzMQ@@._V1_SX300.jpg"},{"Title":"Legend of the Bat","Year":"1978","imdbID":"tt0079454","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMmZiMmIyODYtYmYwYy00YzkzLWIxNTUtZGVlZWNlM2M3NzgwXkEyXkFqcGc@._V1_SX300.jpg"},{"Title":"The Brave Little Bat","Year":"1941","imdbID":"tt0033430","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BOWNkNjc2ZmYtODM2NC00ODEzLWFlMDgtMGM0ZjRmZWNlNzgwXkEyXkFqcGdeQXVyMTY5Nzc4MDY@._V1_SX300.jpg"},{"Title":"Crimson Bat, the Blind Swordswoman","Year":"1969","imdbID":"tt0165379","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BYzk3YjAxZDYtNTk4Zi00OWFiLWI5YTMtZTkyZmE2NjczNzYzXkEyXkFqcGc@._V1_SX300.jpg"}],"totalResults":"238","Response":"True"}';
      Map data = json.decode(jsonResponse);

      // final Response(:data) =
      //     await _restClient.get('?s=$title&page=1&apikey=5379703b');
      // if (data.containsKey('Error')) {
      //   return [];
      // } else {
      return data['Search']
          .map<MovieModel>((m) => MovieModel.fromJson(m))
          .toList();
      // }
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar ativos');
    }
  }

  @override
  Future<MovieModel> fetchMobie(String? id) async {
    try {
      final Response(:data) = await _restClient.get('?i=$id&apikey=5379703b');

      return MovieModel.fromJson(data);
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar ativos');
    }
  }
}
