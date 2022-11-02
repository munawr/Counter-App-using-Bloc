// main.dart file
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'SignInScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// initializing the firebase app
  await Firebase.initializeApp();

// calling of runApp
  runApp(GoogleSignIn());
}

class GoogleSignIn extends StatefulWidget {
  GoogleSignIn({Key? key}) : super(key: key);
  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      home: SignInScreen(),
    );
  }
}
