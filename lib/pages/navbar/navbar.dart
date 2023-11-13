import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../auth/login_screen.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Navbar extends StatelessWidget {
  Navbar({Key? key}) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<Map<String, dynamic>?> getUserData() async {
    final user = auth.currentUser;
    if (user != null) {
      final userSnapshot = await firestore.collection('users').doc(user.uid).get();
      final profileSnapshot = await firestore.collection('profile').doc(user.uid).get();

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
     await googleSignIn.disconnect();
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
            final userImage = snapshot.data?['image'] ?? "";

            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 4),
                  color: Colors.transparent, // Background color
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: Container(
                          width: 70,
                          height: 70,
                          child: Image(
                            image: userImage.isNotEmpty
                                ? NetworkImage(userImage)
                                : AssetImage('assets/images/defaultAvatar.png') as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 55, left: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            userName,
                            style: GoogleFonts.plusJakartaSans(
                              color: const Color(0xFF3A3A3A),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12.0),
                    child: InkWell(
                      onTap: () {
                        // Add your payment functionality here
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            SvgPicture.asset("assets/images/paymentIcon.svg"),
                            Padding(
                              padding: const EdgeInsets.only(right: 80.0, left: 30.0),
                              child: Text(
                                "Payments",
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: const Color(0xFF2E9496),
                                ),
                              ),
                            ),
                            SvgPicture.asset("assets/images/rightArrow.svg")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(right: 15),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12.0),
                    child: InkWell(
                      onTap: () {
                        signOut(context);
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            SvgPicture.asset("assets/images/logoutIcon.svg"),
                            Padding(
                              padding: const EdgeInsets.only(right: 107.0, left: 30.0),
                              child: Text(
                                "Logout",
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: const Color(0xFF2E9496),
                                ),
                              ),
                            ),
                            SvgPicture.asset("assets/images/rightArrow.svg")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("An error occurred"));
          }
        },
      ),
    );
  }
}
