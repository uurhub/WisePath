import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';


class EmailSendPage extends StatefulWidget {
  @override
  _EmailSendPageState createState() => _EmailSendPageState();
}

class _EmailSendPageState extends State<EmailSendPage> {
  final _key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController body = TextEditingController();

  sendEmail(String subject, String body, String recipientemail) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: [recipientemail],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDAD8D8),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bize mail göndererek ulaşabilirsiniz",style: TextStyle(fontSize: 20),),
              SizedBox(height: 50,),
              TextFormField(
                readOnly: true,
                controller: email,
                decoration: InputDecoration(
                  hintText: 'wisepathh@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 30),


              TextFormField(
                controller: subject,
                decoration: InputDecoration(
                  hintText: 'konu giriniz',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 30),


              TextFormField(
                controller: body,
                decoration: InputDecoration(
                  hintText: 'başlık giriniz',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 30),


              ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    sendEmail(subject.text, body.text, email.text);
                  }
                },
                style:ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),primary: Colors.white), 
                            child: const Text("Gönder",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
              ),
              SizedBox(height: 30,),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, "/userprofilePage");
              }, child: Text("Profil Sayfasına Geri Dön",style: TextStyle(color: Colors.black),))
            ],
          ),
        ),
      ),
    );
  }
}