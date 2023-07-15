import 'package:f_8_bootcamp/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Şifre sıfırlama linki gönderildi. Emailinizi kontrol edin!'),
          );
        },
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPageUI()),
      );
    } catch (e) {
      print(e.toString());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffDAD8D8),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Image.asset('assets/images/wisepathlogo.png'),
                    ),
                  ],
                ),
                const Text(
                  "Email'inizi giriniz ve size gönderdiğimiz\n"
                      "            link ile şifrenizi sıfırlayın",
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color(0xff3D3F54),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Email',
                    ),
                    controller: _emailController,
                  ),
                ),
                SizedBox(height: 10),
                MaterialButton(
                  onPressed: passwordReset,
                  child: Text('Parolayı Sıfırla'),
                  textColor: const Color(0xffDAD8D8),
                  color: const Color(0xff3D3F54),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/loginPage");
                  }, 
                  child: Text(
                    "Giriş sayfasına geri dön",
                    style: TextStyle(color: Colors.black),
                    ) 
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
