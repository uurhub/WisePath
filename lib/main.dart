import 'package:f_8_bootcamp/pages/auth/login_page.dart';
import 'package:f_8_bootcamp/pages/auth/sign_up_page.dart';
import 'package:f_8_bootcamp/pages/auth/verification_code_page.dart';
import 'package:f_8_bootcamp/pages/main_pages/student_page.dart';
import 'package:f_8_bootcamp/pages/main_pages/teacher_page.dart';
import 'package:f_8_bootcamp/pages/auth/dropdown_page.dart';
import 'package:f_8_bootcamp/pages/main_pages/user_profile_page.dart';
import 'package:f_8_bootcamp/pages/welcome_pages/login_select_page.dart';
import 'package:f_8_bootcamp/pages/welcome_pages/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'pages/auth/logout_page.dart';
import 'package:provider/provider.dart';
import 'package:f_8_bootcamp/provider/auth_provider.dart';



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
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_)=> AuthProvider()),],
    child: MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
        "/loginPage" :(context) => LoginPageUI(),
        "/signUp" :(context) => SignUpPageUI(),
        "/dropdownPage":(context) => DropDownPage(),
        "/loginSelectPage":(context) => LoginSelectPage(),
        "/logoutPage":(context) => LogOutPage(),
        "/studentPage":(context) => Student(),
        "/teacherPage":(context) => Teacher(),
        "/verificationPage":(context) => VerificationCodeState(),
        "/userprofilePage":(context) => UserProfileScreen()
      },
    home: UserProfileScreen(),
    ),
    );
  }
}