import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  const User(
      {required this.bio,
      required this.email,
      required this.followers,
      required this.following,
      required this.photoUrl,
      required this.uid,
      required this.username});

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "bio": bio,
        "followers": followers,
        "following": following,
        "photourl": photoUrl,
      };
  static User UserFromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        username: snapshot['username'],
        bio: snapshot['bio'],
        email: snapshot['email'],
        uid: snapshot['uid'],
        followers: snapshot['followers'],
        following: snapshot['following'],
        photoUrl: snapshot['photourl']);
  }
}
