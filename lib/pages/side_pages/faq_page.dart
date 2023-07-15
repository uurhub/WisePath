import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.square(250),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: AppBar(
                leading: Container(
                  margin: EdgeInsets.only(top: 30.0),
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/userprofilePage");
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                flexibleSpace: Container(
                  height: 20,
                  margin: EdgeInsets.all(20),
                ),
                toolbarHeight: 230,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                backgroundColor: Color(0xFF3D3F54),
                centerTitle: true,
                title: const Column(
                  children: [
                    Text(
                      'S.S.S.',
                        style: TextStyle(
                          fontSize: 30,
                        )),
                        SizedBox(height: 30,),
                    Text(
                      "Sıkça Sorulan Sorular",
                      style: TextStyle(
                        fontSize: 15
                      ),
                      )
                  ],
                ),
              ),
            ),
          ),
          body: ListView(
            children: [
              ExpansionTile(
                title: Text('dddddddddd',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('xxxxxxxxxxxxxxxxx',
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
              ExpansionTile(
                title: Text('asdasdasdasd',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('bbbbbbbbbbbbsadsadasdasdasdsadsadasdsa',
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
              ExpansionTile(
                title: Text('cccccccccc',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('aaaaaaaaaaaa',
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
              ExpansionTile(
                title: Text('asdasdasdasd',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('bbbbbbbbbbbb',
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
              ExpansionTile(
                title: Text('asdasdasdasd',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('bbbbbbbbbbbb',
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
              ExpansionTile(
                title: Text('asdasdasdasd',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('bbbbbbbbbbbb',
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
              ExpansionTile(
                title: Text('asdasdasdasd',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('bbbbbbbbbbbb',
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
