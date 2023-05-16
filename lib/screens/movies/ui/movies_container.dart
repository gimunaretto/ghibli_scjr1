import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../login/bloc/auth_cubit.dart';

import '../bloc/movies_cubit.dart';
import '../bloc/movies_cubit_state.dart';
import 'movies_screen.dart';

class MoviesContainer extends StatelessWidget {
  const MoviesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        MoviesCubitProvider(),
        AuthCubitProvider(),
      ],
      child: BlocBuilder<MoviesCubit, MoviesCubitState>(
        builder: (context, state) {
          return MoviesScreen(
            filterMovies: (String query) {
              context.read<MoviesCubit>().filterMovies(query);
            },
            isLoading: state.isLoading,
            filteredMoviesList: state.filteredMoviesList,
            hideSearchBar: () {
              context.read<MoviesCubit>().hideSearchBar();
            },
            showSearch: state.showSearch,
            showSearchBar: () {
              context.read<MoviesCubit>().showSearchBar();
            },
            signOut: () {
              context.read<AuthCubit>().signOut();
            },
            hideDescription: () {
              context.read<MoviesCubit>().hideDescription();
            },
            showDescription: state.showDescription,
            viewDescription: () {
              context.read<MoviesCubit>().viewDescription();
            },
          );
        },
      ),
    );
  }
}
