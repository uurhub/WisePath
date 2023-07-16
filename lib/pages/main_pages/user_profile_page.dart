import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isEditing = false;



  Stream<DocumentSnapshot<Map<String, dynamic>>> getData(String uid) {
    Stream<DocumentSnapshot<Map<String, dynamic>>> memberData = FirebaseFirestore.instance.collection("Users").doc(uid).snapshots();

    return memberData;
  }


  @override
  void initState() {
    super.initState();
    getDocId();
    print(docIDs.toString());
  }

  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('Users').get().then(
        (snapshot) => snapshot.docs.forEach((document) {
          print(document.reference);
          setState(() {
            var data=document.reference.id.toString();
            docIDs.add(data);
          });
        },
        )
    );
  }




  @override
  Widget build(BuildContext context) {
    String Name = '';
    String Surname = '';
    String Role = '';
    String Email = '';

    return StreamBuilder(
        stream: getData("Z8QD6ZazAhZwNJNRuigz"),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Text("Hata oluştu.");
          }
          if(snapshot.hasData){
            var data = snapshot.data!.data();
              Name = data!["Name"];
              Surname = data!["Surname"];
              Role = data!["Role"];
              Email = data!["Email"];

    return Scaffold(
      backgroundColor: const Color(0xffDAD8D8), // Arka plan rengi
      appBar: AppBar(
        backgroundColor: const Color(0xffDAD8D8),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset('assets/icons/menu.png'),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(
            'Kullanıcı Profili',
            style: TextStyle(
              fontSize: 30,
              //fontWeight: FontWeight.bold,
              color: const Color(0xff3D3F54),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 15),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            'assets/images/avatar.jpg',
                            width: 165,
                            height: 165,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 50),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$Name $Surname',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  '$Role',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: const Color(0xff3D3F54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          Stream<DocumentSnapshot<Map<String, dynamic>>> getData(String uid) {
                            Stream<DocumentSnapshot<Map<String, dynamic>>> memberData = FirebaseFirestore.instance.collection("Users").doc(uid).snapshots();

                            return memberData;
                          }
                          await getDocId();
                          print("${docIDs.toString()}-----------------");

                          // Facebook iconuna tıklanınca yapılacak işlemler
                        },
                        child: Icon(
                          FontAwesomeIcons.facebook,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 30),
                      InkWell(
                        onTap: () {
                          // Instagram iconuna tıklanınca yapılacak işlemler
                        },
                        child: Icon(
                          FontAwesomeIcons.instagram,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 30),
                      InkWell(
                        onTap: () {
                          // Twitter iconuna tıklanınca yapılacak işlemler
                        },
                        child: Icon(
                          FontAwesomeIcons.twitter,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xff3D3F54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Hakkımda",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isEditing = !_isEditing;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(),
                                  child: _isEditing
                                      ? TextField(
                                    controller: _textEditingController,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Hakkınızda bir şeyler yazın...',
                                      hintStyle: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  )
                                      : InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isEditing = true;
                                        _textEditingController.text = _textEditingController.text;
                                      });
                                    },
                                    child: Text(
                                      _textEditingController.text,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 350,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xff3D3F54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          "Bana Ulaş",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              Email,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/faqPage");
                  },
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff3D3F54)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    )),
                  ),
                  child: Text("Sıkça Sorulan Sorular"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/emailSendPage");
                  },
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff3D3F54)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    )),
                  ),
                  child: Text("Destek ve Yardım"),
                ),
              ],
            ),
          ),
        ),
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
                leading: Icon(FluentIcons.chat_sparkle_16_regular),
                title: const Text(
                  "Meslek Grubu Sohbet",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/privateGroupPage");
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
    );
          }
          return CircularProgressIndicator();
        }
    );
  }
}
