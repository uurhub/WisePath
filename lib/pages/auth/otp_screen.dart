import 'dart:ui';

import 'package:f_8_bootcamp/provider/auth_provider.dart';
import 'package:f_8_bootcamp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../styles/button.dart';
import 'login_page.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key,required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading =Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      backgroundColor: const Color(0xffDAD8D8),
      body:SafeArea(
        child: isLoading == true
        ? const Center(

        child: CircularProgressIndicator(
        color: Colors.purple,
        ), 
        ) 

        : Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 35),
              child: Column(
                children: [
                  Align(
                    alignment:Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/icon_call.png'),
                  ),
                  const SizedBox(height: 20), 
                  const Text(
                  "Kayıt Ol",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                  ),
                ),

            const SizedBox(height: 10),
            const Text(
              "Telefon numaranıza gelen kodu aşağıya giriniz.",
            
              style: TextStyle(
                fontSize: 14,
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
        textAlign: TextAlign.center,
            ),
          const SizedBox(height:20),
          Pinput(
            length: 6,
            showCursor: true,
            defaultPinTheme: PinTheme(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color:Colors.black12),
              ),

                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )

            ),

onCompleted: (value) {
  setState(() {
    otpCode =value;
  });

},

          ),
          const SizedBox(
            height: 25),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height:50 ,
              child:ElevatedButton(
                style: buttonPrimary,
                onPressed: ()  {
                  if( otpCode !=null){
                    verifyOtp(context, otpCode!);
                  } else {
                    showSnackBar(context, '6 Haneli Kodu Girin');

                  }
                },

                child: const Text(
                  "Doğrula",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  
                    fontWeight: FontWeight.bold,
              ) ,
                ),
              
              )
            ),

            const SizedBox(
              height: 15),
              const Text('Kod gelmedi mi?' , style: TextStyle(fontSize: 14, fontWeight:FontWeight.bold, color: Colors.black),),


const SizedBox(height: 10,),
const Text('Kodu tekrar gönder' , style: TextStyle(fontSize: 16, fontWeight:FontWeight.bold, color: Colors.black),),


            
                ],
              ),
          ),
        ),
      
    ),
    );
  }


void verifyOtp(BuildContext context , String userOtp) {
  final ap = Provider.of<AuthProvider>(context, listen: false);
  ap.verifyOtp(context: context,
  verificationId: widget.verificationId, 
  userOtp: userOtp, 
  onSuccess: (){

ap.checkExistingUser().then((value) async{
  if(value== true){

  }else{
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPageUI()),
    (route) => false);

      }

    },
    );

  },
  );
}
}