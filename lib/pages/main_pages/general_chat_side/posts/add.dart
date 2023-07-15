import 'package:f_8_bootcamp/pages/auth/global_doc_id.dart';
import 'package:f_8_bootcamp/pages/auth/posts.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class AddState extends StatefulWidget {
  const AddState({super.key});

  @override
  State<AddState> createState() => _AddStateState();
}

class _AddStateState extends State<AddState> {
  final PostService _postService = PostService();
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Color(0xffDAD8D8),
        title: Text("Bir Gönderi Paylaş",style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          TextButton(
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(0xffDAD8D8
              ))
              ),
            onPressed: ()async{
              _postService.savePost(text);
              Navigator.pop(context);
            }, 
            child: const Text(
              "Paylaş",
              style: TextStyle(
                color: Colors.black
                ),))
        ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 50,horizontal: 10),
          child: Form(
            child: TextFormField(
              onChanged: (val){
                setState(() {
                  text = val;
                });
              },
              decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey,),
                        borderRadius: BorderRadius.circular(40)
                      ),
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(20)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Padding(padding: EdgeInsets.only(top: 0),child: Icon(FluentIcons.text_16_regular)),
                      ),
                      maxLines: 5,
                      minLines: 1,
            )) ,
        ),
    );
  }
}