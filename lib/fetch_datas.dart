import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserMessages extends StatelessWidget {

  final String documentId;
  GetUserMessages({required this.documentId});

  @override
  Widget build(BuildContext context) {

    CollectionReference messages = FirebaseFirestore.instance.collection("posts");

    return FutureBuilder<DocumentSnapshot>(
      future: messages.doc(documentId).get(),
      builder: ((context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
          return Text("${data['text']}");
        }
        return Text("loading");
      }),
    );
  }
}