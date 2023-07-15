import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/post.dart';

class PostService {
    // List<PostModel> _postListFromSnapshot(QuerySnapshot snapshot) {
    // return snapshot.docs.map((doc) {
    //   Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?; 
      
    //   return PostModel(
    //     id: doc.id,
    //     text: data?["text"] ?? "", 
    //     creator: data?["creator"] ?? "", 
    //     timestamp: data?["timestamp"] ?? 0, 
    //   );
    // }).toList();
    
    Future savePost(text) async{
    final _userID = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection("posts").add({
      "text": text,
      "creator":FirebaseAuth.instance.currentUser?.uid,
      "timestamp": FieldValue.serverTimestamp()
    });
  }
  }


  // Stream<List<PostModel>> getPostsByUser(uid){
  //   return FirebaseFirestore.instance
  //   .collection("posts")
  //   .where("creator", isEqualTo: uid)
  //   .snapshots()
  //   .map(_postListFromSnapshot);
  // }
