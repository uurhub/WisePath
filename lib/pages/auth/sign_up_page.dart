import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPageUI extends StatefulWidget {
  const SignUpPageUI({super.key});

  @override
  State<SignUpPageUI> createState() => _SignUpPageUIState();
}

class _SignUpPageUIState extends State<SignUpPageUI> {
  late String email,password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
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
                    // const UserNameTextField(
                    //   hintText: "İsim",
                    //   obsourseText: false,
                    // ),
                    // _sizedBox10(),
                    // const UserNameTextField(
                    //   hintText: "Soyisim",
                    //   obsourseText: false,
                    // ),
                    // _sizedBox10(),
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
                                email: email, password: password
                                );
                                formkey.currentState!.reset();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: 
                                    Text("Giriş yapıldı ana sayfaya yönlendiriliyorsunuz")));
                                    Navigator.pushReplacementNamed(context, "/loginPage");
                              } catch (e) {
                                print(e.toString());
                              }
                            }
                          },
                          style:ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),primary: Colors.white), 
                            child: const Text("Kayıt Ol",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
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



