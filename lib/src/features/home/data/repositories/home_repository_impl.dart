// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get_it/get_it.dart';

import '../../domain/entities/movie.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final remoteDataSource = GetIt.I<HomeRemoteDataSource>();

  @override
  Future<List<Movie>> fetchMovies(String? title) async {
    final listMovieModel = await remoteDataSource.fetchMovies(title);
    return listMovieModel.map((lmm) => Movie.fromMovieModel(lmm)).toList();
  }
}
