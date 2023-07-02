import 'package:f_8_bootcamp/pages/auth/firebase_services.dart';
import 'package:flutter/material.dart';

class LogOutPage extends StatefulWidget {
  const LogOutPage({super.key});

  @override
  State<LogOutPage> createState() => _LogOutPageState();
}

class _LogOutPageState extends State<LogOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(onPressed: () async{
          await FirebaseServices().signOut();
          Navigator.pushNamed(context, "/loginPage");
        }, child: Text("Log Out")),
      ),
    );
  }
}