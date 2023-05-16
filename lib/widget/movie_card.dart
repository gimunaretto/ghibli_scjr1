import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jumping_dot/jumping_dot.dart';

import '../configs/styles.dart';
import '../screens/movies/domain/entities/movie_entity.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {super.key,
      required this.movie,
      this.onPressed,
      this.showDescription = false});

  final void Function()? onPressed;
  final MovieEntity movie;
  final bool? showDescription;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: onPressed,
          child: Stack(
            children: [
              showDescription!
                  ? FutureBuilder<String>(
                      future: Future.delayed(
                          const Duration(seconds: 2),
                          () => movie
                              .description), // Simulating a delayed future for the description
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            height: 150,
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                top: 5, left: 20, right: 20),
                            child: Center(
                              child: JumpingDots(
                                color: const Color.fromARGB(235, 242, 242, 242)
                                    .withOpacity(0.5),
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          return Container(
                            height: 150,
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                top: 57, left: 20, right: 20),
                            child: AutoSizeText(
                              snapshot.data!,
                              minFontSize: 10,
                              style: TextStyles.movieCardDescription,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }
                        return const SizedBox(); // Handle error case if needed
                      },
                    )
                  : Image.network(
                      movie.movieBanner,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      color: Colors.black.withOpacity(0.4),
                      colorBlendMode: BlendMode.darken,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: Center(
                                child: JumpingDots(
                              color: const Color.fromARGB(235, 242, 242, 242)
                                  .withOpacity(0.5),
                            )));
                      },
                    ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Hero(
                    tag: movie.title,
                    child: Material(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: ShapeDecoration(
                              shape: const StadiumBorder(),
                              color: Colors.white.withOpacity(0.2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: AutoSizeText(
                                minFontSize: 11,
                                '${movie.title} | ${movie.releaseDate}',
                                style: TextStyles.movieCardTitle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.movie_creation,
                        size: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 2),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: AutoSizeText(
                          minFontSize: 11,
                          '${movie.director} | ',
                          style: TextStyles.movieCardTitle,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: AutoSizeText(
                          minFontSize: 11,
                          '${movie.producer.substring(0, min(movie.producer.length, 20))}${movie.producer.length > 20 ? "..." : ""}',
                          style: TextStyles.movieCardTitle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      movie.rtScore,
                      style: TextStyles.movieScore,
                    ),
                    const SizedBox(width: 5),
                    const AutoSizeText(
                      'score',
                      style: TextStyles.movieScore,
                    ),
                    RatingBarIndicator(
                      direction: Axis.horizontal,
                      itemSize: 11,
                      rating: double.parse(movie.rtScore) / 100 * 4,
                      itemCount: 4,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
