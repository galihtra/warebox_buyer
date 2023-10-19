import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:io';

class ProfileHeader extends StatefulWidget {
  final String userName;
  final String imageUrl;
  final Function(String) onImageUpdated;

  ProfileHeader({
    required this.userName,
    required this.imageUrl,
    required this.onImageUpdated,
  });

  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final ImagePicker _imagePicker = ImagePicker();
  String? imageUrl;
  bool isUploading = false;

  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageUrl; // Initialize imageUrl from widget property
  }

  Future<void> _uploadImage() async {
    final user = _auth.currentUser;
    if (user == null) return;

    // Show a dialog to choose the image source
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () {
                    Navigator.of(context).pop();
                    _selectImage(ImageSource.gallery);
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                ),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    Navigator.of(context).pop();
                    _selectImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectImage(ImageSource source) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile == null) return;

    setState(() {
      isUploading = true;
    });

    final file = File(pickedFile.path);
    final storageReference = storage.ref().child('profile_images/${user.uid}');
    await storageReference.putFile(file);

    final downloadURL = await storageReference.getDownloadURL();

    // Update the URL in Firestore and in the widget state
    await firestore.collection('profile').doc(user.uid).update({
      'image': downloadURL,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile Update Successfully")),
    );

    setState(() {
      imageUrl = downloadURL; // Update the local imageUrl
      isUploading = false;
    });

    // Notify the parent widget about the image update
    widget.onImageUpdated(downloadURL);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: _uploadImage,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: widget.imageUrl != null && widget.imageUrl.isNotEmpty
                        ? FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: widget.imageUrl,
                            fit: BoxFit.cover,
                          ).image
                        : AssetImage('assets/images/defaultAvatar.png')
                            as ImageProvider,
              ),
              if (isUploading)
                CircularProgressIndicator(), // Show a loading indicator inside the CircleAvatar
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 10.0),
          child: Text(
            widget.userName,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
