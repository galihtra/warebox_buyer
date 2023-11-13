import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pages/dashboard/dashboard_screen.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  final firestore = FirebaseFirestore.instance;

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future<void> googleLogin(BuildContext context) async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final userDocRef = firestore.collection('users').doc(currentUser.uid);
        final profileDocRef = firestore.collection('profile').doc(currentUser.uid);

        // Add data to collection users
        final userDoc = await userDocRef.get();
        if (!userDoc.exists) {
          await userDocRef.set({
            'name': currentUser.displayName,
            'uid': currentUser.uid,
            'email': currentUser.email,
            'isAdmin': false,
          });
        }

        final profileDoc = await profileDocRef.get();
        if (!profileDoc.exists) {
          await profileDocRef.set({
            'username': currentUser.displayName,
            'gender': 'Pria',
            'about': null,
            'address': null,
            'phone_number': null,
            'uid': currentUser.uid,
          });
        }

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      }
    } catch (e) {
      // Handle errors here
      print("error :$e");
      Navigator.pop(context);
      // You can navigate back to the login screen or show an error message here
    }
  }
}
