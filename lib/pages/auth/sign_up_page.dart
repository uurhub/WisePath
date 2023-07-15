import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_8_bootcamp/pages/auth/global_doc_id.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class SignUpPageUI extends StatefulWidget {
  const SignUpPageUI({super.key});

  @override
  State<SignUpPageUI> createState() => _SignUpPageUIState();
}

class _SignUpPageUIState extends State<SignUpPageUI> {
  late String email,password,fullName,lastName;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDAD8D8),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                _sizedBox10(),
                const _wplogo(),
                    emailcheck(),
                    _sizedBox10(),
                    namecheck(),
                    _sizedBox10(),
                    lastnamecheck(),
                    _sizedBox10(),
                    passwordcheck(),
                      _sizedBox50(),
                      
                      SizedBox(
                        height: 45,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              try {
                                var userResult = await firebaseAuth.createUserWithEmailAndPassword(
                                email: email, password: password,
                                );
                                try {
                                  final resultData = await firebaseFirestore.collection("Users").add({
                                    "Name":fullName,
                                    "Surname": lastName,
                                    "Email": email                                  
                                    }).then((DocumentReference doc){
                                      GlobalDocId.latestDocId = doc.id;
                                      Navigator.pushReplacementNamed(context, "/loginPage");
                                    });
                                } catch (e) {
                                  print(e.toString());
                                }
                                formkey.currentState!.reset();  
                              } catch (e) {
                                print(e.toString());
                              }
                            }
                          },
                          style:ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),primary: Colors.white), 
                            child: const Text("Devam Et",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                      ),
                      _sizedBox50(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, "/loginPage");
                          }, 
                          child: Text("Hesabın varsa giriş yapabilirsin",style: TextStyle(color: Colors.black)),)
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding lastnamecheck() {
    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      validator:(value){
                      if (value!.isEmpty) {
                        return "Burayı boş bırakamazsınız";
                      }else{}
                      return null;
                    },
                    onSaved: (value){
                      lastName = value!;
                    },
                    style: const TextStyle(color: Colors.black),
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white,),
                      borderRadius: BorderRadius.circular(40)
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(40)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Soyisim",
                    prefixIcon: Padding(padding: EdgeInsets.only(top: 0),child: Icon(FluentIcons.people_16_regular),)
                    ),
                    ),
                  );
  }

  Padding namecheck() {
    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      validator:(value){
                      if (value!.isEmpty) {
                        return "Burayı boş bırakamazsınız";
                      }else{}
                      return null;
                    },
                    onSaved: (value){
                      fullName = value!;
                    },
                    style: const TextStyle(color: Colors.black),
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white,),
                      borderRadius: BorderRadius.circular(40)
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(40)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "İsim",
                    prefixIcon: Padding(padding: EdgeInsets.only(top: 0),child: Icon(FluentIcons.people_16_regular),)
                    ),
                    ),
                  );
  }
  

  Padding passwordcheck() {
    return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    validator:(value){
                      if (value!.isEmpty) {
                        return "Burayı boş bırakamazsınız";
                      }else{}
                      return null;
                    },
                    onSaved: (value){
                      password = value!;
                    },
                    style: const TextStyle(color: Colors.black),
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white,),
                      borderRadius: BorderRadius.circular(40)
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(40)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Şifre",
                    prefixIcon: Padding(padding: EdgeInsets.only(top: 0),child: Icon(FluentIcons.lock_closed_16_regular),)
                    ),
                  ),
                );
  }

  Padding emailcheck() {
    return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    validator:(value) {
                      if (value!.isEmpty) {
                        return "Burayı boş bırakamazsınız";
                      }
                      return null;
                    },
                    onSaved: (value){
                      email = value!;
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white,),
                      borderRadius: BorderRadius.circular(40)
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(40)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Email",
                    prefixIcon: Padding(padding: EdgeInsets.only(top: 0),child: Icon(FluentIcons.mail_16_regular),)
                    ),
                  ),
                );
  }
  

  SizedBox _sizedBox10() => const SizedBox(height: 10,);

  SizedBox _sizedBox25() => const SizedBox(height: 25,);

  SizedBox _sizedBox20() => const SizedBox(height: 20,);

  SizedBox _sizedBox50() => const SizedBox(height: 50,);

}

class _wplogo extends StatelessWidget {
  const _wplogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Image.asset("assets/images/wisepathlogo.png",width: 200)
        );
  }
}



