import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:f_8_bootcamp/styles/button.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';

class VerificationCodeState extends StatefulWidget {
  const VerificationCodeState({super.key});

  @override
  State<VerificationCodeState> createState() => _VerificationCodeStateState();
}

class _VerificationCodeStateState extends State<VerificationCodeState> {
final TextEditingController phoneController =TextEditingController();


Country selectedCountry =Country(
  phoneCode: '90', 
  countryCode: 'TR', 
  e164Sc: 0, 
  geographic: true, 
  level: 1, 
  name: 'Türkiye', 
  example: 'Türkiye', 
  displayName: 'Türkiye', 
  displayNameNoCountryCode: 'TR', 
  e164Key: '');




  @override
  Widget build(BuildContext context) {

    phoneController.selection =TextSelection.fromPosition(
    TextPosition(offset: phoneController.text.length,
    ));

    return Scaffold(
      backgroundColor: const Color(0xffDAD8D8),
      body:SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 35),
              child: Column(
                children: [
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
              "Telefon numaranı ekle. Sana bir kod göndereceğiz.",
            
              style: TextStyle(
                fontSize: 14,
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
        textAlign: TextAlign.center,
        ),
          const SizedBox(height:20),

          TextFormField(
            controller: phoneController,
            style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
          
            ),
            onChanged: (value) {
              setState(() {
                phoneController.text =value;
});
            },
            decoration: InputDecoration(
              hintText: "Telefon numaranızı giriniz",
              hintStyle: TextStyle(fontWeight: FontWeight.w500,
              fontSize:15,
              color: Colors.grey.shade600,
              
              ),
              
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color:Colors.black12,)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color:Colors.black12,
                ),
            ),

            prefixIcon:Container(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {

                  showCountryPicker(
                    context: context,
                    countryListTheme: 
                    const CountryListThemeData(
                      bottomSheetHeight: 550,
                    ),
                    onSelect: (value) {
                    setState(() {
                      selectedCountry =value;
                    });
                  });
                  
                },
                child: Text(
                  
                  "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
          

                style: const TextStyle(
                  fontSize:18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                
                )
              ,),

                        ),
                      ),
                    suffixIcon: phoneController.text.length > 9 
                    
                    ? Container(
                      height: 30,
                      width: 40,
                      margin: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green
                      ),
                      child: const Icon(Icons.done, color: Colors.white,
                      size: 20,
                      ),
                    ) : null,
                    ),
                  ),
                  const SizedBox(height: 60,),

                SizedBox(
                width: double.infinity,
                height: 50,


                child: ElevatedButton(
                style: buttonPrimary,
                onPressed: () => sendPhoneNumber(),

                child: const Text(
                  "Gönder",
                  style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  
                    fontWeight: FontWeight.bold,
                    ),
                ),
                )
                )
                ],
              ),
            ),
          ),
        ),
    );
  }

void sendPhoneNumber(){


  final ap =Provider.of<AuthProvider>(context, listen: false);
  String phoneNumber =phoneController.text.trim();
  ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  
}
}