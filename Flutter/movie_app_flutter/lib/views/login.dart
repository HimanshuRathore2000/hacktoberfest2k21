import 'package:flutter/material.dart';
import 'package:movie_app/services/colors.dart';
import 'package:movie_app/services/firebase-auth.dart';
import 'package:movie_app/widgets/google-signin-button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBgColor,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                    future: Authentication.initializeFirebase(context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error initializing Firebase');
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Column(
                          children: [
                            Image.asset(
                              "assets/logo.png",
                              width: 300,
                            ),
                            GoogleSignInButton(),
                          ],
                        );
                      }
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.black,
                        ),
                      );
                    },
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
