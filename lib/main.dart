import 'package:f_8_bootcamp/pages/auth/login_page.dart';
import 'package:f_8_bootcamp/pages/auth/sign_up_page.dart';
import 'package:f_8_bootcamp/pages/welcome_pages/dropdown_page.dart';
import 'package:f_8_bootcamp/pages/welcome_pages/login_select_page.dart';
import 'package:f_8_bootcamp/pages/welcome_pages/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
        "/loginPage" :(context) => LoginPageUI(),
        "/signUp" :(context) => SignUpPageUI(),
        "/dropdownPage":(context) => DropDownPage(),
        "/loginSelectPage":(context) => LoginSelectPage(),
      },
    home:OnBoardingScreen(),
    );
  }
}

