class MovieEntity {
  MovieEntity(
      {required this.id,
      required this.title,
      required this.originalTitle,
      required this.originalTitleRomanised,
      required this.image,
      required this.movieBanner,
      required this.description,
      required this.director,
      required this.producer,
      required this.releaseDate,
      required this.runningTime,
      required this.rtScore,
      required this.people,
      required this.species,
      required this.locations,
      required this.vehicles,
      required this.url});

  final String description;
  final String director;
  final String id;
  final String image;
  final List<String> locations;
  final String movieBanner;
  final String originalTitle;
  final String originalTitleRomanised;
  final List<String> people;
  final String producer;
  final String releaseDate;
  final String rtScore;
  final String runningTime;
  final List<String> species;
  final String title;
  final String url;
  final List<String> vehicles;
}
