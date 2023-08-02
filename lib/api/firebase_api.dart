


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pingolearn/ui/news_list.dart';

class FirebaseAPIs{

 static final FirebaseAuth _auth = FirebaseAuth.instance;
 static User? currentUser = FirebaseAuth.instance.currentUser;



 static  logInWithEmailAndPassword(BuildContext context, TextEditingController _emailController, TextEditingController _passwordController) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (userCredential.user != null) {
        // Navigate to another screen after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NewsList(),
          ),
        );
      }
      // Successful sign-in, you can navigate to the next screen or do other actions here.
      print("Logged in as: ${userCredential.user!.email}");
    } catch (e) {
      // Handle sign-in errors, e.g., wrong credentials, network issues, etc.
      print("Error signing in: $e");
    }
  }


 static signInWithEmailAndPassword(BuildContext context,TextEditingController _emailController,TextEditingController _passwordController) async {
   try {
     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
       email: _emailController.text.trim(),
       password: _passwordController.text.trim(),
     );
     // Successful sign-in, you can navigate to the next screen or do other actions here.
     print("Signed in as: ${userCredential.user!.email}");

     if (userCredential.user != null) {
       // Navigate to another screen after successful login
       Navigator.pushReplacement(
         context,
         MaterialPageRoute(
           builder: (context) => NewsList(),
         ),
       );
     }

   } catch (e) {
     // Handle sign-in errors, e.g., wrong credentials, network issues, etc.
     print("Error signing in: $e");
   }
 }


}