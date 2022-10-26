// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/services/colors.dart';
import 'package:movie_app/services/fade-in.dart';
import 'package:movie_app/services/hive-implementation.dart';
import 'package:movie_app/views/movie-form-edit.dart';
import 'package:movie_app/views/movie-page.dart';

class MovieListTile extends StatefulWidget {
  final int index;
  final String title;
  final String director;
  final String path;
  MovieListTile(this.index, this.title, this.director, this.path);
  @override
  _MovieListTileState createState() =>
      _MovieListTileState(index, title, director, path);
}

class _MovieListTileState extends State<MovieListTile> {
  final int index;
  final String title;
  final String director;
  final String path;
  _MovieListTileState(this.index, this.title, this.director, this.path);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                MoviePage("https://www.google.com/search?q=${title}+imdb"),
          ),
        );
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: "movie-image-middle",
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: FileImage(File(path)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      title,
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      director,
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: accentColor,
                          onPrimary: Colors.white,
                          fixedSize: Size(50, 35),
                          shadowColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MovieFormEditPage(index,
                                  path, title, director, "movie-image-middle"),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.edit_outlined,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: accentColor,
                          onPrimary: Colors.white,
                          fixedSize: Size(50, 35),
                          shadowColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () => {deleteMovie(index)},
                        child: Icon(
                          Icons.delete_outlined,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieListTileStartOne extends StatefulWidget {
  final int index;
  final String title;
  final String director;
  final String path;
  MovieListTileStartOne(this.index, this.title, this.director, this.path);

  @override
  _MovieListTileStartOneState createState() =>
      _MovieListTileStartOneState(index, title, director, path);
}

class _MovieListTileStartOneState extends State<MovieListTileStartOne> {
  final int index;
  final String title;
  final String director;
  final String path;
  _MovieListTileStartOneState(this.index, this.title, this.director, this.path);
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.2,
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    MoviePage("https://www.google.com/search?q=${title}+imdb"),
              ),
            );
          },
          child: Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: "movie-image-start-one",
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: FileImage(File(path)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                          title,
                          textAlign: TextAlign.right,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          director,
                          textAlign: TextAlign.right,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: accentColor,
                              onPrimary: Colors.white,
                              fixedSize: Size(50, 35),
                              shadowColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MovieFormEditPage(
                                      index,
                                      path,
                                      title,
                                      director,
                                      "movie-image-start-one"),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.edit_outlined,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: accentColor,
                              onPrimary: Colors.white,
                              fixedSize: Size(50, 35),
                              shadowColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () => {
                              deleteMovie(index),
                            },
                            child: Icon(
                              Icons.delete_outlined,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MovieListTileStart extends StatefulWidget {
  final int index;
  final String title;
  final String director;
  final String path;
  MovieListTileStart(this.index, this.title, this.director, this.path);

  @override
  _MovieListTileStartState createState() =>
      _MovieListTileStartState(index, title, director, path);
}

class _MovieListTileStartState extends State<MovieListTileStart> {
  final int index;
  final String title;
  final String director;
  final String path;
  _MovieListTileStartState(this.index, this.title, this.director, this.path);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  MoviePage("https://www.google.com/search?q=${title}+imdb"),
            ),
          );
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: "movie-image-start",
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: FileImage(File(path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        title,
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        director,
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: accentColor,
                            onPrimary: Colors.white,
                            fixedSize: Size(50, 35),
                            shadowColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MovieFormEditPage(index,
                                    path, title, director, "movie-image-start"),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: accentColor,
                            onPrimary: Colors.white,
                            fixedSize: Size(50, 35),
                            shadowColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () => {
                            deleteMovie(index),
                          },
                          child: Icon(
                            Icons.delete_outlined,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MovieListTileEnd extends StatefulWidget {
  final int index;
  final String title;
  final String director;
  final String path;
  MovieListTileEnd(this.index, this.title, this.director, this.path);

  @override
  _MovieListTileEndState createState() =>
      _MovieListTileEndState(index, title, director, path);
}

class _MovieListTileEndState extends State<MovieListTileEnd> {
  final int index;
  final String title;
  final String director;
  final String path;
  _MovieListTileEndState(this.index, this.title, this.director, this.path);
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.2,
      Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    MoviePage("https://www.google.com/search?q=${title}+imdb"),
              ),
            );
          },
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: "movie-image-end",
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: FileImage(File(path)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                          title,
                          textAlign: TextAlign.right,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          director,
                          textAlign: TextAlign.right,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: accentColor,
                              onPrimary: Colors.white,
                              fixedSize: Size(50, 35),
                              shadowColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MovieFormEditPage(index,
                                      path, title, director, "movie-image-end"),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.edit_outlined,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: accentColor,
                              onPrimary: Colors.white,
                              fixedSize: Size(50, 35),
                              shadowColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () => {
                              deleteMovie(index),
                            },
                            child: Icon(
                              Icons.delete_outlined,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
