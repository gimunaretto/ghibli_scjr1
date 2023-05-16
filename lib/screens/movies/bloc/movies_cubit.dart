import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/use_cases/remote_fetch_movies.dart';
import '../domain/use_cases/fetch_movies.dart';
import 'movies_cubit_state.dart';

class MoviesCubit extends Cubit<MoviesCubitState> {
  MoviesCubit(
    MoviesCubitState moviesCubitState, {
    required this.fetchMovies,
  }) : super(
          MoviesCubitState(
              moviesList: [],
              filteredMoviesList: [],
              isLoading: false,
              showSearch: false,
              showDescription: false),
        );

  late FetchMovies fetchMovies;

  Future<void> fetch() async {
    emit(state.copyWith(isLoading: true));
    final moviesList = await fetchMovies.execute();
    emit(state.copyWith(
      isLoading: false,
      moviesList: moviesList,
      filteredMoviesList: moviesList,
    ));
  }

  void showSearchBar() {
    emit(state.copyWith(showSearch: true));
  }

  void hideSearchBar() {
    emit(state.copyWith(showSearch: false));
  }

  void viewDescription() {
    emit(state.copyWith(showDescription: true));
  }

  void hideDescription() {
    emit(state.copyWith(showDescription: false));
  }

  void filterMovies(String query) {
    final filteredMoviesList = state.moviesList.where((movie) {
      final titleLower = movie.title.toLowerCase();
      final directorLower = movie.director.toLowerCase();
      final producerLower = movie.producer.toLowerCase();
      final releaseDate = movie.releaseDate.toString();
      final ratingScore = movie.rtScore.toString();

      final queryLower = query.toLowerCase();

      return titleLower.contains(queryLower) ||
          directorLower.contains(queryLower) ||
          producerLower.contains(queryLower) ||
          releaseDate.contains(queryLower) ||
          ratingScore.contains(queryLower);
    }).toList();

    emit(state.copyWith(filteredMoviesList: filteredMoviesList));
  }
}

class MoviesCubitProvider extends BlocProvider<MoviesCubit> {
  MoviesCubitProvider({super.key, Widget? child})
      : super(
          create: (context) => MoviesCubit(
            MoviesCubitState(
              moviesList: [],
              filteredMoviesList: [],
              isLoading: false,
              showSearch: false,
              showDescription: false,
            ),
            fetchMovies: RemoteFetchMovies(),
          )..fetch(),
          child: child,
        );

  static MoviesCubit of(BuildContext context) => BlocProvider.of(context);
}
