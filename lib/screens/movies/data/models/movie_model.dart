import '../../domain/entities/movie_entity.dart';

class MovieModel {
  final String id;
  final String title;
  final String originalTitle;
  final String originalTitleRomanised;
  final String image;
  final String movieBanner;
  final String description;
  final String director;
  final String producer;
  final String releaseDate;
  final String runningTime;
  final String rtScore;
  final List<String> people;
  final List<String> species;
  final List<String> locations;
  final List<String> vehicles;
  final String url;

  MovieModel({
    required this.id,
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
    required this.url,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) => MovieModel(
        id: map['id'],
        title: map['title'],
        originalTitle: map['original_title'],
        originalTitleRomanised: map['original_title_romanised'],
        image: map['image'],
        movieBanner: map['movie_banner'],
        description: map['description'],
        director: map['director'],
        producer: map['producer'],
        releaseDate: map['release_date'],
        runningTime: map['running_time'],
        rtScore: map['rt_score'],
        people: _replaceUrl(map['people']),
        species: _replaceUrl(map['species']),
        locations: _replaceUrl(map['locations']),
        vehicles: _replaceUrl(map['vehicles']),
        url: map['url'].toString().replaceAll(
            "ghibliapi.herokuapp.com", "newghibliapi.herokuapp.com"),
      );

  MovieEntity toEntity() => MovieEntity(
      id: id,
      title: title,
      originalTitle: originalTitle,
      originalTitleRomanised: originalTitleRomanised,
      image: image,
      movieBanner: movieBanner,
      description: description,
      director: director,
      producer: producer,
      releaseDate: releaseDate,
      runningTime: runningTime,
      rtScore: rtScore,
      people: people,
      species: species,
      locations: locations,
      vehicles: vehicles,
      url: url);

  static List<String> _replaceUrl(dynamic value) {
    if (value is String) {
      return [
        value.replaceFirst(
            'ghibliapi.herokuapp.com', 'newghibliapi.herokuapp.com')
      ];
    } else if (value is List) {
      return value
          .cast<String>()
          .map((url) => url.replaceFirst(
              'ghibliapi.herokuapp.com', 'newghibliapi.herokuapp.com'))
          .toList();
    } else {
      return [];
    }
  }
}
