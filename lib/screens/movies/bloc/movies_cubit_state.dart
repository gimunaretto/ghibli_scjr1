import '../domain/entities/movie_entity.dart';

class MoviesCubitState {
  MoviesCubitState({
    required this.moviesList,
    required this.filteredMoviesList,
    required this.isLoading,
    required this.showSearch,
    required this.showDescription,
  });

  final List<MovieEntity> moviesList;
  final List<MovieEntity> filteredMoviesList;
  final bool isLoading;
  final bool showSearch;
  final bool showDescription;

  MoviesCubitState copyWith(
          {List<MovieEntity>? moviesList,
          List<MovieEntity>? filteredMoviesList,
          bool? showSearch,
          bool? isLoading,
          bool? showDescription}) =>
      MoviesCubitState(
          moviesList: moviesList ?? this.moviesList,
          filteredMoviesList: filteredMoviesList ?? this.filteredMoviesList,
          isLoading: isLoading ?? this.isLoading,
          showSearch: showSearch ?? this.showSearch,
          showDescription: showDescription ?? this.showDescription);
}
