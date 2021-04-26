part of 'models.dart';

class MovieModel extends Equatable {
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String posterPath;
  final String backdropPath;

  MovieModel({
    @required this.id,
    @required this.voteAverage,
    @required this.title,
    @required this.overview,
    @required this.posterPath,
    @required this.backdropPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      title: json['title'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path']);

  @override
  List<Object> get props =>
      [id, title, voteAverage, overview, posterPath, backdropPath];
}
