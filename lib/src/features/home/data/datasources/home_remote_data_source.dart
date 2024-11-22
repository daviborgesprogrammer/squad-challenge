import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/restClient/rest_client.dart';
import '../models/movie_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<String>> fetchMovies(String? title);
  Future<MovieModel> fetchMovieDetail(String? id);

  factory HomeRemoteDataSource() => HomeRemoteDataSourceImpl();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final _restClient = GetIt.I<RestClient>();

  @override
  Future<List<String>> fetchMovies(String? title) async {
    try {
      final Response(:data) = await _restClient
          .get('?s=$title&page=1&apikey=${AppConstants.apiKey}');
      if (data.containsKey('Error')) {
        return [];
      } else {
        return data['Search']
            .map<String>((m) => m['imdbID'].toString())
            .toList();
      }
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar ativos');
    }
  }

  @override
  Future<MovieModel> fetchMovieDetail(String? id) async {
    try {
      final Response(:data) = await _restClient.get('?i=$id&apikey=5379703b');

      return MovieModel.fromJson(data);
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar ativos');
    }
  }
}
