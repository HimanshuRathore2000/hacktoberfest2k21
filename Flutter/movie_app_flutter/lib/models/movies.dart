import 'package:hive/hive.dart';

part 'movies.g.dart';

@HiveType(typeId: 1)
class Movie {
  @HiveField(0)
  String title;
  @HiveField(1)
  String director;
  @HiveField(2)
  String imagePath;

  Movie(
    this.title,
    this.director,
    this.imagePath,
  );
}
