import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginSelectPage extends StatefulWidget{
  @override
  State<LoginSelectPage> createState() => _LoginSelectPageState();
}

class _LoginSelectPageState extends State<LoginSelectPage> {
  @override
  final firebaseAuth = FirebaseAuth.instance;

  Widget build(BuildContext context){
    return Scaffold(
        body: SafeArea(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Column(
                    children:<Widget>[
                      const Text("HOŞGELDİNİZ", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),),
                      const SizedBox (height: 20),
                      Text("Nasıl Devam Etmak İstediğinizi Seçiniz",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15
                        ),),


                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height /3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/loginselect.png')
                        )
                    ),
                  ),
                  Column(
                    children:<Widget> [
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: (){
                          Navigator.pushNamed(context, "/loginPage");
                        },
                        color: Color(0xffDAD8D8),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: const Text("Giriş Yap / Kayıt Ol", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: const Border(
                              bottom: BorderSide(color: Colors.black),
                              top:  BorderSide(color: Colors.black),
                              left:  BorderSide(color: Colors.black),
                              right:  BorderSide(color: Colors.black),
                            )
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () async{
                            try {
                              final result = await firebaseAuth.signInAnonymously();
                              print(result.user!.uid);
                              Navigator.pushNamed(context, "/studentPage");
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                          color: Color(0xffDAD8D8),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: const Text("Giriş Yapmadan Devam Et", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18

                          ),),
                        ),

                      )

                    ],

                  )
                ],
              ),
            )
        )
    );
  }
}