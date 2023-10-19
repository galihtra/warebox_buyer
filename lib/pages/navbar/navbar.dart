import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../auth/login_screen.dart';

class Navbar extends StatelessWidget {
  Navbar({Key? key}) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getUserData() async {
    final user = auth.currentUser;
    if (user != null) {
      final userSnapshot =
          await firestore.collection('users').doc(user.uid).get();
      final profileSnapshot =
          await firestore.collection('profile').doc(user.uid).get();

      if (userSnapshot.exists && profileSnapshot.exists) {
        final userData = userSnapshot.data() as Map<String, dynamic>;
        final profileData = profileSnapshot.data() as Map<String, dynamic>;

        // Merge user and profile data
        userData.addAll(profileData);

        return userData;
      }
    }
    return null;
  }

  signOut(BuildContext context) async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<Map<String, dynamic>?>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final userName = snapshot.data?['name'] ?? 'Your Name';
            final userEmail = snapshot.data?['email'] ?? 'Your Email';
            final userImage = snapshot.data?['image'] ?? "";

            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(userName),
                  accountEmail: Text(userEmail),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: userImage.isNotEmpty
                        ? NetworkImage(userImage)
                        : AssetImage('assets/images/defaultAvatar.png')
                            as ImageProvider, // Use default image if userImage is empty
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/image3.jpg"), // Background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Logout"),
                  onTap: () {
                    signOut(context);
                  },
                )
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading state
            return Center(child: CircularProgressIndicator());
          } else {
            // Error state
            return Center(child: Text("An error occurred"));
          }
        },
      ),
    );
  }
}
