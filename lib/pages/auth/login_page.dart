import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPageUI extends StatefulWidget {
  const LoginPageUI({super.key});

  @override
  State<LoginPageUI> createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {
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
                Padding(
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
                  ),
                  _sizedBox25(),
                    Padding(
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
                  ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200),
                        child: TextButton(
                          onPressed: (){}, 
                          child: const Text(
                            "Şifreni mi unuttun?",
                            style: TextStyle(
                              color: Colors.black
                              ),),
                              ),
                      ),
                      _sizedBox10(),
                      SizedBox(
                        height: 45,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              final userResult = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
                              Navigator.pushNamed(context, "/dropdownPage");
                              try {
                                print(userResult.user!.email);
                              } catch (e) {
                                print(e.toString());
                              }
                            }
                          },
                          style:ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),primary: Colors.white), 
                            child: const Text("Giriş Yap",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                      ),
                      _sizedBox25(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.9,color: Colors.grey[500],
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text("ya da", style: TextStyle(color:Colors.grey[700] ),),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.9,color: Colors.grey[500],
                                )),
                          ],
                        ),
                      ),
                      _sizedBox25(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _boxButtonImages(imagepath: "assets/images/google.png",),
                          SizedBox(width: 80,),
                          _boxButtonImages(imagepath: "assets/images/linkedin.png",)
                        ],
                      ),
                      _sizedBox25(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Hesabın yok mu?",style: TextStyle(color: Colors.grey[700]),),
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, "/signUp");
                            }, 
                            child: const Text("Hemen oluştur.",style: TextStyle(color: Colors.black)),)
                        ],
                      )
                      
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _sizedBox10() => const SizedBox(height: 10,);

  SizedBox _sizedBox25() => const SizedBox(height: 25,);

  SizedBox _sizedBox20() => const SizedBox(height: 20,);

  SizedBox _sizedBox50() => const SizedBox(height: 50,);

}

class _boxButtonImages extends StatelessWidget {
  const _boxButtonImages({super.key, this.imagepath,});

  final imagepath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print("clicked");
      },
      child: Ink(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white),
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
            ),
            
        child: Image.asset(imagepath,height: 40,)
        ),
    );
  }
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



class UserNameTextField extends StatelessWidget {
  const UserNameTextField({super.key, required this.hintText, required this.obsourseText});

  final String hintText;
  final bool obsourseText;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: obsourseText,
        
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
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])
        ),
      ),
    );
  }
}