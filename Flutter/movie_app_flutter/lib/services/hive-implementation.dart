import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/models/movies.dart';

initHive() async {
  Hive.registerAdapter(MovieAdapter());
  await Hive.initFlutter();
  await Hive.openBox('movies');
}

addMovie(Movie newMovie) async {
  var moviesBox = await Hive.openBox('movies');
  moviesBox.add(newMovie);
  print(moviesBox.length);
}

deleteMovie(int index) async {
  var moviesBox = await Hive.openBox('movies');
  moviesBox.deleteAt(index);
}

clearAllMovie() async {
  var moviesBox = await Hive.openBox('movies');
  moviesBox.clear();
}

editMovie(int index, Movie editedMovie) async {
  print(index);
  print(editedMovie.title);
  var moviesBox = Hive.box('movies');
  moviesBox.putAt(index, editedMovie);
}
