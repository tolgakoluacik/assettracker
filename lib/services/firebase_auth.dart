import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../views/home.dart';

Future<void> signInWithEmailAndPassword(String email, String password, BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(email: userCredential.user!.email!,),
      ),
    );


  } on FirebaseAuthException catch (e) {
    //String? errorMessage = e.message;
    String errorMessage = getFirebaseAuthErrorMessage(e.code);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('default-error'.tr())),
    );
  }
}

Future<void> registerWithEmailAndPassword(String email, String password, BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(email: userCredential.user!.email!,),
      ),
    );
  } on FirebaseAuthException catch (e) {
    //String? errorMessage = e.message;
    String errorMessage = getFirebaseAuthErrorMessage(e.code);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  }
  catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('default-error'.tr())),
    );
  }
}

String getFirebaseAuthErrorMessage(String errorCode) {
  switch (errorCode) {
    case 'invalid-email':
      return 'invalid-email'.tr();
    case 'user-disabled':
      return 'user-disabled'.tr();
    case 'user-not-found':
      return 'user-not-found'.tr();
    case 'wrong-password':
      return 'wrong-password'.tr();
    case 'email-already-in-use':
      return 'email-already-in-use'.tr();
    case 'operation-not-allowed':
      return 'operation-not-allowed'.tr();
    case 'weak-password':
      return 'weak-password'.tr();
    default:
      return 'default-error'.tr();
  }
}