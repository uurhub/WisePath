import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:f_8_bootcamp/pages/auth/sign_up_page.dart';

import 'global_doc_id.dart';


class DropDownPage extends StatefulWidget {
  @override
  _DropDownPageState createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  final formkey = GlobalKey<FormState>();
  final firebaseFirestore = FirebaseFirestore.instance;
  String title = 'DropDownButton';
  String? _jobsVal;
  List _jobsName = [
    'Öğrenci',
    'Öğretmen',
    'Doktor',
    'Mühendis',
    'Avukat'

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDAD8D8),
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Image.asset("assets/images/wisepathlogo.png",width: 300),
              Text("Devam etmek için lütfen meslek grubunuzu seçiniz",style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
              SizedBox(height: 80,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: DropdownButton(
                    hint: Text('Meslek Grubunuzu Seçiniz'),
                    dropdownColor: Colors.white,
                    elevation: 5,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36.0,
                    isExpanded: true,
                    value: _jobsVal,
                    style: TextStyle(color: Colors.black, fontSize: 22.0),
                    onChanged: (value) {
                      setState(() {
                        _jobsVal= value as String?;
                      });
                    },
                    items: _jobsName.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                width: 150,
                height: 45,
                child: firebaseRoleUpdate(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton firebaseRoleUpdate(BuildContext context) {
    return ElevatedButton(onPressed: () async {
                print(_jobsVal);
                if (_jobsVal == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Meslek Seçim Ekranını Boş Bırakamazsınız"))
                  );
                }else{
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                      try {
                        final  userRoleData = await firebaseFirestore.collection('Users').doc(GlobalDocId.latestDocId).update({"Role":_jobsVal,});
                        print(GlobalDocId.latestDocId);
                        final  userRoleDataGoogle = await firebaseFirestore.collection('Users').doc(GlobalDocIdGoogle.latestDocIdGoogle).update({"Role":_jobsVal,});
                      }catch (e) {
                        print(e.toString());
                    }
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: 
                      Text("Giriş yapıldı meslek sayfanıza yönlendiriliyorsunuz")));
                
                if (_jobsVal == "Öğrenci") {
                  Navigator.pushNamed(context,"/studentPage");
                }else if(_jobsVal == "Öğretmen"){
                  Navigator.pushNamed(context, "/teacherPage");
                }
                }},
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: Colors.white),
              child: const Text(
                "Devam et",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
                  ));
  }
}
