import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:warebox_buyer/pages/navbar/navbar.dart';

import '../profile/profile_header/profile_header.dart';
import '../profile/profile_input_row/profile_input_row.dart';
import '../profile/profile_textfield/profile_textfield.dart';
import '../profile/profile_update_button/update_button.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({Key? key}) : super(key: key);

  @override
  State<ProfileScreenWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreenWidget> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  String selectGender = 'Pria';

  Future<void> fetchUserData() async {
    setState(() {
      isLoading = true;
    });

    final user = _auth.currentUser;
    if (user != null) {
      final userData =
          await firestore.collection('profile').doc(user.uid).get();
      if (userData.exists) {
        final data = userData.data() as Map<String, dynamic>;
        setState(() {
          usernameController.text = data['username'] ?? "";
          addressController.text = data['address'] ?? "";
          aboutController.text = data['about'] ?? "";
          phoneNumberController.text = data['phone_number'] ?? "";
          selectGender = data['gender'] ?? '';
          imageUrlController.text =
              data['image'] ?? ""; // Initialize imageUrlController
          isLoading = false;
        });
      }
    }
  }

  Future<void> updateUserData() async {
    setState(() {
      isLoading = true;
    });

    final user = _auth.currentUser;
    if (user != null) {
      try {
        await firestore.collection('profile').doc(user.uid).set({
          'username': usernameController.text,
          'address': addressController.text,
          'about': aboutController.text,
          'phone_number': phoneNumberController.text,
          'gender': selectGender,
          'image': imageUrlController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Profile Update Successfully")));

        fetchUserData();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error updating profile: $e")));
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle the back button press
        Navigator.of(context).pop();
        return true; // Return true to allow the back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: Align(
            alignment: const AlignmentDirectional(0.00, 0.00),
            child: Builder(builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 24,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }),
          ),
          title: Align(
            alignment: const AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
              child: Text(
                'Profile',
                textAlign: TextAlign.start,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        drawer: Navbar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                ProfileHeader(
                  userName: usernameController.text,
                  imageUrl: imageUrlController.text,
                  onImageUpdated: (newImageUrl) {
                    // Handle the updated image URL here
                    setState(() {
                      imageUrlController.text = newImageUrl;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                ProfileTextField(
                  label: "Username",
                  controller: usernameController,
                ),
                const SizedBox(height: 12.0),
                ProfileTextField(
                  label: "Address",
                  controller: addressController,
                ),
                const SizedBox(height: 12.0),
                ProfileInputRow(
                  leftLabel: "Phone Number",
                  leftController: phoneNumberController,
                  rightLabel: "Gender",
                  rightDropdown: DropdownButton<String>(
                    value: selectGender,
                    items: <String>['Pria', 'Wanita'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectGender = newValue ?? 'Pria';
                      });
                    },
                    underline: Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                ProfileTextField(
                  label: "About",
                  controller: aboutController,
                  maxLines: 5,
                ),
                const SizedBox(height: 40),
                if (isLoading)
                  const CircularProgressIndicator()
                else
                  ProfileButton(
                    label: "Update",
                    onPressed: () {
                      updateUserData();
                    },
                  ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
