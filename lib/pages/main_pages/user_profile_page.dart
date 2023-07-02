import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String _editedAboutMe = "";
  TextEditingController _aboutMeController = TextEditingController();
  bool _isEditing = false;

  @override
  void dispose() {
    _aboutMeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDAD8D8), // Arka plan rengi
      appBar: AppBar(
        backgroundColor: const Color(0xffDAD8D8),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: const Color(0xff3D3F54),
          ),
          iconSize: 45,
          onPressed: () {},
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Kullanıcı Profili',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color(0xff3D3F54),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 15),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            'assets/images/avatar.jpg',
                            width: 165,
                            height: 165,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,bottom: 50),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Berat Çetin',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Bilgisayar Mühendisi',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: const Color(0xff3D3F54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // Facebook iconuna tıklanınca yapılacak işlemler
                        },
                        child: Icon(
                          FontAwesomeIcons.facebook,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 30),
                      InkWell(
                        onTap: () {
                          // Instagram iconuna tıklanınca yapılacak işlemler
                        },
                        child: Icon(
                          FontAwesomeIcons.instagram,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 30),
                      InkWell(
                        onTap: () {
                          // Twitter iconuna tıklanınca yapılacak işlemler
                        },
                        child: Icon(
                          FontAwesomeIcons.twitter,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xff3D3F54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              "Hakkımda",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: _isEditing
                                  ? TextFormField(
                                enabled: _isEditing,
                                controller: _aboutMeController,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    _editedAboutMe = newValue;
                                  });
                                },
                              )
                                  : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isEditing = true;
                                  });
                                },
                                child: Text(
                                  _editedAboutMe,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: IconButton(
                          icon: Icon(
                            _isEditing ? Icons.check : Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              if (_isEditing) {
                                _editedAboutMe = _aboutMeController.text;
                              }
                              _isEditing = !_isEditing;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 350,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xff3D3F54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          "Bana Ulaş",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "example@example.com",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff3D3F54)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    )),
                  ),
                  child: Text("Sıkça Sorulan Sorular"),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff3D3F54)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    )),
                  ),
                  child: Text("Destek ve Yardım"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
