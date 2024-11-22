// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get_it/get_it.dart';

import '../../domain/entities/movie.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final remoteDataSource = GetIt.I<HomeRemoteDataSource>();

  @override
  Future<List<Movie>> fetchMovies(String? title) async {
    final listImdbId = await remoteDataSource.fetchMovies(title);
    final listMovie = <Movie>[];
    for (var imdbID in listImdbId) {
      listMovie.add(
        Movie.fromMovieModel(
          await remoteDataSource.fetchMovieDetail(imdbID),
        ),
      );
    }
    return listMovie;
  }
}
