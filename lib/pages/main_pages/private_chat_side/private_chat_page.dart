import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';


class PrivateMessagePage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<PrivateMessagePage> {
  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Color(0xffDAD8D8)  ,
        title: Center(child: Text("Doktorlar",style: TextStyle(color: Color(0xff3D3F54),fontSize: 25,),)),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                  _bodyChat(),
                SizedBox(
                  height: 120,
                )
              ],
            ),
            _formChat(),
          ],
        ),
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
                leading: Icon(FluentIcons.chat_sparkle_16_regular),
                title: const Text(
                  "Meslek Grubu Sohbet",
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

  Widget _bodyChat() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 25),
        width: double.infinity,
        decoration: BoxDecoration(
          
          color: Colors.white,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _itemChat(
              chat: 1,
              message:
              'Ali\nMerhaba',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message: 'Görkem\nmerhaba 🐣',
              time: '18.00',
            ),
              _itemChat(
              chat: 1,
              message: 'İrem\nmerhaba hoş geldin Ali',
              time: '18.00',
            ),
            _itemChat(
              chat: 1,
              message: "Ali\nBir hasta, migren ataklarını yönetmek için triptan ilaçları kullanıyor, ancak hamile olduğunu öğrendi. Hamilelik sırasında migren tedavisi için hangi ilaçları önerirsiniz?",
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message:
              "Görkem \nHamilelik sırasında triptan ilaçları yerine parasetamol kullanımını ve yatıştırıcıları düşünebilirsin",
              time: '18.03',
            ),
            _itemChat(
              chat: 1,
              message:
              "İrem\nEvet, Görkem'e katılıyorum.",
              time: '18.05',
            ),
            _itemChat(
              chat: 1,
              message: 'Ali\nTeşekkürler arkadaşlar kolay gelsin, iyi çalışmalar',
              time: '18.05',
            ),
          ],
        ),
      ),
    );
  }

  _itemChat({required int chat, message, time}) {
    return Row(
      mainAxisAlignment:
      chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: chat == 0 ? Colors.indigo.shade100 : Colors.indigo.shade50,
              borderRadius: chat == 0
                  ? BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              )
                  : BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Text('$message'),
          ),
        ),
        chat == 1
            ? Text(
          '$time',
          style: TextStyle(color: Colors.grey.shade400),
        )
            : SizedBox(),
      ],
    );
  }

  Widget _formChat() {
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Type your message...',
              suffixIcon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.indigo),
                padding: EdgeInsets.all(14),
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Colors.blueGrey[50]!),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey[50]!),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final double size;
  final image;
  final EdgeInsets margin;
  Avatar({this.image, this.size = 50, this.margin = const EdgeInsets.all(0)});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            image: AssetImage(image),
          ),
        ),
    ),);}
}