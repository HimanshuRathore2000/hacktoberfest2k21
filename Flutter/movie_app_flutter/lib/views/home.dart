import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/services/colors.dart';
import 'package:movie_app/services/firebase-auth.dart';
import 'package:movie_app/services/hive-implementation.dart';
import 'package:movie_app/views/movie-form.dart';
import 'package:movie_app/widgets/movie-list-tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 5.0,
          right: 3.0,
        ),
        child: FloatingActionButton.extended(
          label: Row(
            children: [
              Icon(
                Icons.movie_outlined,
                color: Colors.black87,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Add Movie",
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MovieFormPage(),
              ),
            );
          },
        ),
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Theme(
                  data: ThemeData(
                    dividerColor: bgColor,
                    highlightColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: accentColor,
                              onPrimary: Colors.white,
                              fixedSize: Size(150, 45),
                              shadowColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () => {
                              clearAllMovie(),
                            },
                            child: Text(
                              "Clear All",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: accentColor,
                              onPrimary: Colors.white,
                              fixedSize: Size(150, 45),
                              shadowColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () => {
                              Authentication.signOut(context: context),
                            },
                            child: Text(
                              "Log-Out",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                    trailing: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: user!.photoURL!,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          color: accentColor,
                        ),
                        width: 40,
                      ),
                    ),
                    title: Text(
                      'Hello ' + user!.displayName!,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          fontSize: 18),
                    ),
                  ),
                ),
              ]),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ValueListenableBuilder(
                    valueListenable: Hive.box("movies").listenable(),
                    builder: (context, Box box, _) {
                      if (box.values.isEmpty)
                        return Center(
                          child: Text(
                            "No Movies Added",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                                fontSize: 18),
                          ),
                        );
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: box.values.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              top: 2.0,
                              bottom: 2.0,
                            ),
                            child: (box.values.length == 1)
                                ? MovieListTileStartOne(
                                    index,
                                    box.getAt(index).title,
                                    box.getAt(index).director,
                                    box.getAt(index).imagePath,
                                  )
                                : (index == 0)
                                    ? MovieListTileStart(
                                        index,
                                        box.getAt(index).title,
                                        box.getAt(index).director,
                                        box.getAt(index).imagePath,
                                      )
                                    : (index == box.values.length - 1)
                                        ? MovieListTileEnd(
                                            index,
                                            box.getAt(index).title,
                                            box.getAt(index).director,
                                            box.getAt(index).imagePath,
                                          )
                                        : MovieListTile(
                                            index,
                                            box.getAt(index).title,
                                            box.getAt(index).director,
                                            box.getAt(index).imagePath,
                                          ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
