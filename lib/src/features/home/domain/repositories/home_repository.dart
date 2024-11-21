import '../../data/repositories/home_repository_impl.dart';
import '../entities/movie.dart';

abstract class HomeRepository {
  Future<List<Movie>> fetchMovies(String? title);

  factory HomeRepository() => HomeRepositoryImpl();
}
