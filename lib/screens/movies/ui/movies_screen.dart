import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ghibli_scjr1/widget/totoro_background.dart';

import '../../../configs/images.dart';
import '../../../widget/movie_card.dart';
import '../../login/ui/login_screen.dart';
import '../domain/entities/movie_entity.dart';

class MoviesScreen extends StatelessWidget {
  static const String id = '/films_screen';
  const MoviesScreen(
      {super.key,
      required this.filteredMoviesList,
      required this.filterMovies,
      required this.isLoading,
      required this.showSearch,
      required this.hideSearchBar,
      required this.showSearchBar,
      required this.signOut,
      required this.hideDescription,
      required this.viewDescription,
      required this.showDescription});

  final List<MovieEntity> filteredMoviesList;
  final Function(String) filterMovies;
  final Function() hideSearchBar;
  final Function() showSearchBar;
  final Function() hideDescription;
  final Function() viewDescription;
  final Function() signOut;
  final bool isLoading;
  final bool showSearch;
  final bool showDescription;

  Widget _buildTitle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
              height: 56,
              fit: BoxFit.cover,
              image: Images.logoTitle,
              filterQuality: FilterQuality.high),
          SpeedDial(
            direction: SpeedDialDirection.left,
            elevation: 3,
            renderOverlay: false,
            buttonSize: const Size(48, 45),
            childrenButtonSize: const Size(45, 45),
            children: [
              SpeedDialChild(
                elevation: 3,
                child: showSearch
                    ? Stack(
                        children: const [
                          Icon(Icons.search, color: Colors.white),
                          Padding(
                            padding: EdgeInsets.only(left: 1, top: 2),
                            child: Icon(Icons.close_rounded,
                                size: 17, color: Colors.red),
                          ),
                        ],
                      )
                    : const Icon(Icons.search, color: Colors.white),
                backgroundColor: Colors.green.shade200,
                onTap: () {
                  if (showSearch) {
                    hideSearchBar();
                  } else {
                    showSearchBar();
                  }
                },
              ),
              SpeedDialChild(
                elevation: 3,
                child: const Icon(Icons.logout_rounded, color: Colors.white),
                backgroundColor: Colors.red.shade200,
                onTap: () {
                  signOut();
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                },
              ),
            ],
            icon: Icons.menu,
          ),
        ],
      ),
    );
  }

  Widget _searchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: Color.fromRGBO(242, 242, 242, 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.search, size: 26),
            Expanded(
              child: TextFormField(
                onChanged: (query) {
                  filterMovies(query);
                },
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: 'Search Movie, Director, Date etc',
                  contentPadding: EdgeInsets.zero,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    height: 1,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: TotoroBackground(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // _buildTitle1(),
                _buildTitle(context),
                showSearch ? _searchBar(context) : Container(),
                const SizedBox(height: 15),
                isLoading
                    ? const Expanded(
                        child: Center(child: CircularProgressIndicator()))
                    : Expanded(
                        child: SizedBox(
                          height: height * 0.7,
                          child: ListView.separated(
                              clipBehavior: Clip.none,
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: filteredMoviesList.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 15),
                              itemBuilder: (context, index) {
                                return MovieCard(
                                    movie: filteredMoviesList[index],
                                    onPressed: () {
                                      if (showDescription) {
                                        hideDescription();
                                      } else {
                                        viewDescription();
                                      }
                                    },
                                    showDescription: showDescription);
                              }),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
