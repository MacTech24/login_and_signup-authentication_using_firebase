import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static signupUser(
    String emailAddress,
    String password,
    String fullName,
    BuildContext context,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.purple,
            content: Text(
              "Weak password",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.purple,
            content: Text(
              'The account already exists for that email.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  static signin(
    String emailAddress,
    String password,
    String fullName,
    BuildContext context,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.purple,
            content: Text(
              'No user found for that email.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.purple,
            content: Text(
              'Wrong password Try again.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    }
  }


}
