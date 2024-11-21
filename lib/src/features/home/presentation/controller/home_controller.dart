import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/entities/movie.dart';
import '../../domain/usecases/fetch_movie.dart';

enum HomeState {
  initial,
  loading,
  loaded,
  error,
}

class HomeController {
  final _fetchMovie = GetIt.I<FetchMovie>();

  TextEditingController searchText = TextEditingController();

  ValueNotifier<HomeState> state = ValueNotifier<HomeState>(HomeState.initial);
  ValueNotifier<List<Movie>> movies = ValueNotifier<List<Movie>>([]);

  Future<void> setSearch(String text) async {
    state.value = HomeState.loading;
    movies.value = await _fetchMovie.call(text);
    state.value = HomeState.loaded;
  }
}
