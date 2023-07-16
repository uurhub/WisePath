import 'dart:convert';

import 'package:f_8_bootcamp/model/jobs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class FindJobsAPIPage extends StatefulWidget {
  const FindJobsAPIPage({super.key});

  @override
  State<FindJobsAPIPage> createState() => _FindJobsAPIPageState();
}
List<Jobs> jobs = [];

class _FindJobsAPIPageState extends State<FindJobsAPIPage> {
  Future getJobs() async{
    var response = await http.get(Uri.https("arbeitnow.com","/api/job-board-api"));
    var jsonData = jsonDecode(response.body);
  
    for(var eachJobs in jsonData["data"]){
      final job = Jobs(
        companyname: eachJobs["company_name"], 
        location: eachJobs["location"], 
        title: eachJobs["title"], 
        url: eachJobs["url"]
        );

        jobs.add(job);
        
    }

  }

  @override
  
  Widget build(BuildContext context) {
    getJobs();
    return Scaffold(
            appBar: AppBar(
        leading: Builder(
      builder: (context) => IconButton(
        icon: Image.asset('assets/icons/menu.png'),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    ),
        backgroundColor: Color(0xffDAD8D8),
        title: Text(
          "Güncel Yurtdışı Remote İş İlanları",
          style: TextStyle(
            color: Color(0xff3D3F54)
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(child: Text("İlanın üzerine tıklayarak ilgili iş ilanına gidebilirsiniz.",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey[500]),)),
          SizedBox(height: 20,),
          Expanded(
            child: FutureBuilder(
              future: getJobs(),
              builder: (context,snapshot){
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: jobs.length,
                    itemBuilder: (context,index){
                      var url = Uri.parse(jobs[index].url.toString());
                      //print(url);
                      return GestureDetector(
                        onTap: () async => await launchUrl(url),
                        child: Card(
                          color: Colors.grey,
                          child: ListTile(
                            title: Text(
                              jobs[index].title
                              ,style: TextStyle(fontSize: 19)),
                            subtitle: Text(
                              "\n"+"Company Name : " + jobs[index].companyname  + "\n" +"\nLocation : " + jobs[index].location +"\n"+ "\nJobs Url : " + jobs[index].url+ "\n",style: TextStyle(fontSize: 14),),
                          ),
                        ),
                      );
                    },
                  );
                }
                else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
              ),
          ),
        ],
      ),
drawer: Drawer(
        backgroundColor: Color(0xffDAD8D8),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 150, left: 50),
              child: ListTile(
                leading: Icon(FluentIcons.people_16_regular),
                title: const Text(
                  "Profil",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/userprofilePage");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: ListTile(
                leading: Icon(FluentIcons.chat_16_regular),
                title: const Text(
                  "Genel Sohbet",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/generalChatPage");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: ListTile(
                leading: Icon(FluentIcons.briefcase_16_regular),
                title: const Text(
                  "Remote İş İlanları",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/findJobsPage");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: ListTile(
                leading: Icon(FluentIcons.arrow_exit_20_regular),
                title: const Text(
                  "Çıkış Yap",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () async {
                  CircularProgressIndicator();
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, "/loginPage");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}