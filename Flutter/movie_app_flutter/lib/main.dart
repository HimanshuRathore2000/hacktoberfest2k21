import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/services/colors.dart';
import 'package:movie_app/services/hive-implementation.dart';
import 'package:movie_app/views/login.dart';
// import 'package:movie_app/views/splashscreen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: lightBgColor,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie_App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
