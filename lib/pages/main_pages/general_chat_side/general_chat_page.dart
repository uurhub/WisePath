import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../fetch_datas.dart';

class GeneralChatPage extends StatefulWidget {
  const GeneralChatPage({required Key key}) : super(key: key);

  @override
  State<GeneralChatPage> createState() => _GeneralChatPageState();
}

class _GeneralChatPageState extends State<GeneralChatPage> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> _chatStream;

  @override
  void initState() {
    super.initState();
    _chatStream = FirebaseFirestore.instance
        .collection("posts")
        .orderBy("timestamp", descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset('assets/icons/menu.png'),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        backgroundColor: Color(0xffDAD8D8),
        title: const Center(
          child: Text(
            "General Chat",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _chatStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final docIDs = snapshot.data?.docs.map((doc) => doc.reference.id).toList();
                  return ListView.builder(
                    itemCount: docIDs?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.grey,
                        child: ListTile(
                          //title: Text("Görkem"),
                          title: GetUserMessages(documentId: docIDs![index]),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color(0xffDAD8D8),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 150, left: 50),
              child: ListTile(
                leading: Icon(FluentIcons.people_16_regular),
                title: const Text(
                  "Profil",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/userprofilePage");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: ListTile(
                leading: Icon(FluentIcons.chat_16_regular),
                title: const Text(
                  "Genel Sohbet",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/generalChatPage");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: ListTile(
                leading: Icon(FluentIcons.briefcase_16_regular),
                title: const Text(
                  "Remote İş İlanları",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/findJobsPage");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: ListTile(
                leading: Icon(FluentIcons.arrow_exit_20_regular),
                title: const Text(
                  "Çıkış Yap",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () async {
                  CircularProgressIndicator();
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, "/loginPage");
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          Navigator.pushNamed(context, "/addContentPage");
        },
        child: const Icon(FluentIcons.chat_add_16_regular),
      ),
    );
  }
}
