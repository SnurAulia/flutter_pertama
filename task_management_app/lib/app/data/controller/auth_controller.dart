import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_management_app/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserCredential? _userCredential;
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    print(googleUser!.email);
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => _userCredential = value);

// FIREBASE
    CollectionReference users = firestore.collection('users');

    final cekUsers = await users.doc(googleUser.email).get();

    if (cekUsers.exists) {
      users.doc(googleUser.email).set({
        'uid': _userCredential!.user!.uid,
        'name': googleUser.displayName,
        'email': googleUser.email,
        'photo': googleUser.photoUrl,
        'createdAt': _userCredential!.user!.metadata.creationTime.toString(),
        'LastLoginat':
            _userCredential!.user!.metadata.lastSignInTime.toString(),
      });
    } else {
      users.doc(googleUser.email).set({
        'LastLoginat':
            _userCredential!.user!.metadata.lastSignInTime.toString(),
      });
    }
    Get.offAllNamed(Routes.HOME);
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
