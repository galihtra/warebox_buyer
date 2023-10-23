class UserProfile {
  String? username;
  String? address;
  String? about;
  String? phoneNumber;
  String? gender;
  String? imageUrl;

  UserProfile({
    this.username,
    this.address,
    this.about,
    this.phoneNumber,
    this.gender,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'address': address,
      'about': about,
      'phone_number': phoneNumber,
      'gender': gender,
      'image': imageUrl,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      username: map['username'],
      address: map['address'],
      about: map['about'],
      phoneNumber: map['phone_number'],
      gender: map['gender'],
      imageUrl: map['image'],
    );
  }
}
