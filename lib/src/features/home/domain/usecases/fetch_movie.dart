import 'package:get_it/get_it.dart';

import '../entities/movie.dart';
import '../repositories/home_repository.dart';

class FetchMovie {
  final HomeRepository repository = GetIt.I<HomeRepository>();

  FetchMovie();

  Future<List<Movie>> call(String title) async {
    return repository.fetchMovies(title);
  }
}
