import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class AnonymousUserLogin {
  Widget anonymousUserLogin(VoidCallback onPressed) {
    if (FirebaseAuth.instance.currentUser!.isAnonymous) {
      return Visibility(
        visible: false,
        child: FloatingActionButton(
          backgroundColor: Color(0xff3D3F54),
          onPressed: () {},
          child: const Icon(FluentIcons.chat_add_16_regular),
        ),
      );
    } else {
      return FloatingActionButton(
        backgroundColor: Color(0xff3D3F54),
        onPressed: onPressed,
        child: const Icon(FluentIcons.chat_add_16_regular),
      );
    }
  }
}

class AnonymousUserAppbar {
  Widget anonymousUserAppbar(){
    if (FirebaseAuth.instance.currentUser!.isAnonymous) {
      return Visibility(
        visible: true,
        child: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.login_outlined,color: Color(0xff3D3F54),),
              onPressed: () {
                Navigator.pushNamed(context, "/signUp");
              },
            ),
          ),
      );
    } else{
        return Builder(
            builder: (context) => IconButton(
              icon: Image.asset('assets/icons/menu.png'),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          );
    }
  }
}