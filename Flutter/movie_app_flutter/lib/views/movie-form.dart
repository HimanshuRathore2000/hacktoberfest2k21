import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/models/movies.dart';
import 'package:movie_app/services/colors.dart';
import 'package:movie_app/services/hive-implementation.dart';

class MovieFormPage extends StatefulWidget {
  const MovieFormPage({Key? key}) : super(key: key);

  @override
  _MovieFormPageState createState() => _MovieFormPageState();
}

class _MovieFormPageState extends State<MovieFormPage> {
  final ImagePicker _picker = ImagePicker();
  var imagePicked;
  var imagePath;
  String? titleMovie;
  String? directorMovie;

  submitMovie() {
    if (titleMovie == null) {
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
    } else if (directorMovie == null) {
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
    } else if (!imagePicked) {
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
            "Please Select Image",
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
      Navigator.of(context).pop();
      addMovie(_newMovie);
    }
  }

  @override
  void initState() {
    imagePicked = false;
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
                    'Fill Movie Details',
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
                            onChanged: (val) {
                              titleMovie = val;
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
                            onChanged: (val) {
                              directorMovie = val;
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
                                imagePicked = true;
                              });
                            }
                          },
                          child: (imagePicked)
                              ? Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: FileImage(File(imagePath)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Tap To Select An Image",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
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
