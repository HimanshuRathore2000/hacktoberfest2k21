import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/models/movies.dart';
import 'package:movie_app/services/colors.dart';
import 'package:movie_app/services/hive-implementation.dart';
import 'package:movie_app/views/home.dart';

class MovieFormEditPage extends StatefulWidget {
  final index;
  final imagePath;
  final titleMovie;
  final directorMovie;
  final hero;
  MovieFormEditPage(this.index, this.imagePath, this.titleMovie,
      this.directorMovie, this.hero);

  @override
  _MovieFormEditPageState createState() => _MovieFormEditPageState(
      index, imagePath, titleMovie, directorMovie, hero);
}

class _MovieFormEditPageState extends State<MovieFormEditPage> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _directorController = TextEditingController();

  var index;
  var imagePath;
  String? titleMovie;
  String? directorMovie;
  var hero;

  _MovieFormEditPageState(this.index, this.imagePath, this.titleMovie,
      this.directorMovie, this.hero);

  submitMovie() async {
    if (titleMovie == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          content: Text(
            "Please Enter Movie Title",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    } else if (directorMovie == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          content: Text(
            "Please Enter Name of Director",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    } else {
      var _newMovie =
          Movie(titleMovie.toString(), directorMovie.toString(), imagePath);
      print(_newMovie.title + _newMovie.director);
      await editMovie(index, _newMovie);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
        ModalRoute.withName('/'),
      );
    }
  }

  @override
  void initState() {
    _titleController.text = titleMovie.toString();
    _directorController.text = directorMovie.toString();
    print(index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 5.0,
          right: 3.0,
        ),
        child: FloatingActionButton.extended(
          label: Row(
            children: [
              Text(
                "Submit",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          elevation: 0,
          highlightElevation: 1,
          isExtended: true,
          backgroundColor: accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: () {
            submitMovie();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black87,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Text(
                    'Edit Movie Details',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: lightBgColor,
                ),
                child: Theme(
                  data: ThemeData(
                    textSelectionTheme: TextSelectionThemeData(
                      cursorColor: accentColor,
                      selectionHandleColor: accentColor,
                      selectionColor: accentColor,
                    ),
                  ),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: _titleController,
                            onChanged: (val) {
                              titleMovie = val;
                              print(titleMovie);
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: lightBgColor,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: lightBgColor,
                                ),
                              ),
                              hintText: "Title",
                              hintStyle: TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                            strutStyle: StrutStyle(
                              height: 1.3,
                              fontWeight: FontWeight.w800,
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: _directorController,
                            onChanged: (val) {
                              directorMovie = val;
                              print(directorMovie);
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: lightBgColor,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: lightBgColor,
                                ),
                              ),
                              hintText: "Director",
                              hintStyle: TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                            strutStyle: StrutStyle(
                              height: 1.3,
                              fontWeight: FontWeight.w800,
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: GestureDetector(
                            onTap: () async {
                              final XFile? image = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              if (image == null) {
                                print("User Didnt select");
                              } else {
                                imagePath = image.path;
                                setState(() {
                                  print(image.path);
                                });
                              }
                            },
                            child: Hero(
                              tag: hero,
                              child: Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: FileImage(File(imagePath)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
