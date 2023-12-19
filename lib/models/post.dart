import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postUrl;
  final String postId;
  final DateTime datePublished;
  final String profImage;
  final List likes;

  const Post(
      {required this.datePublished,
      required this.description,
      required this.postUrl,
      required this.profImage,
      required this.uid,
      required this.username,
      required this.likes,
      required this.postId});

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "description": description,
        "postUrl": postUrl,
        "datePublished": datePublished,
        "profImage": profImage,
        "likes": likes,
        "postId": postId,
      };
  static Post UserFromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
        username: snapshot['username'],
        description: snapshot['description'],
        postUrl: snapshot['postUrl'],
        uid: snapshot['uid'],
        datePublished: snapshot['datePublished'],
        profImage: snapshot['following'],
        likes: snapshot['likes'],
        postId: snapshot['postId']);
  }
}
