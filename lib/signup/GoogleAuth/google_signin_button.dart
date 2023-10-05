import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dockable/screens/main/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:dockable/controllers/MenuAppController.dart';

import 'google_authentification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });
                
                User? user =
                await Authentication.signInWithGoogle(context: context);

                setState(() {
                  _isSigningIn = false;
                });

                if (user != null) {
                  String? displayGoogleName = user.displayName;
                  String? userId = user.uid;
                  String? userEmail = user.email;
                  print(displayGoogleName);
                  print(userId);
                  print(userEmail);
                  final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
                  if (userDoc.exists)
                  {
                    Navigator.of(context)
                      .pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            MultiProvider(
                              providers: [
                                ChangeNotifierProvider(
                                  create: (context) => MenuAppController(),
                                ),
                              ],
                              child: MainScreen(),
                            ),
                      ),
                    );
                  }
                  else {
                    await FirebaseFirestore.instance.collection('users').doc(userId)
                    .set({
                      'firstname' : displayGoogleName,
                      'email' : userEmail,
                      'uid' : userId,
                    });
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/google_logo.png"),
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}