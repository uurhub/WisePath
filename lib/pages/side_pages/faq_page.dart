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
                title: Text('WisePath Nedir?',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('WisePath, meslek sahibi kişilerin mesleki hayatlarında kendileriyle benzer problemleri yaşayan veya henüz kariyerinin başında olan bireylerin bir arada olduğu karma bir ekosistemdir',
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
              ExpansionTile(
                title: Text('WisePath, sürdürülebilir kalkınma hedeflerine nasıl katkıda bulunuyor?',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("WisePath olarak Sürdülebilir Kalkında Hedeflerinden biri olan SKH 8'e etki etmeyi amaçlayarak; toplumdaki bireylere kendilerine yakışacak iş'i bulmada ve kendilerini istihdam ederek ekonomik büyümeye katkı sağlanmasını hedeflemektedir.",
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
              ExpansionTile(
                title: Text("WisePath'i kimler kullanabilir?",
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("WisePath'in hedef kitlesi;Meslek sahibi bireyler,Öğrenciler,Yeni mezunlar ve Gönüllü olarak mentörlük vermek isteyen bireylerdir.",
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
              ExpansionTile(
                title: Text('Uygulama içerisinde herhangi bir harcama yapmak zorunda mıyım?',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Hayır değilsin, uygulamanın tüm özelliklerini ücretsiz kullanabilirsin ayrıca buradaki herkes gönüllük esasında burada bulunuyor ve diğer kullanıcılara yardım ediyor.',
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
              ExpansionTile(
                title: Text('Uygulamada hangi meslekler ve sektörler hakkında bilgi bulabilirim?',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Uygulama içerisinde şimdilik birkaç tane meslek grubu için sayfamız bulunmakta,zamanla beraber daha fazla meslek grupları ekliyor olacağız.',
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
              ExpansionTile(
                title: Text('Kariyerimle ilgili destek almak için nasıl bir yol izlemeliyim?',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Kariyerin için ilgili meslek grubunda veya tüm kullanıcılara açık olan sohbet sayfasında dilediğin her şeyi sorabilir, bir mentör desteğine ihtiyacın var ise mentörlük sayfasından gönüllü mentörler tarafından destek alabilirsin.',
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
              ExpansionTile(
                title: Text('WisePath, iş arama sürecinde bana nasıl yardımcı olabilir?',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Meslek grupları veya tüm kullanıcılara açık olan sayfalarda bir iş aradığını belirtebilir veya işe alım yapan kişiler ile iletişim kurabilirsin. Ayrıca "Remote İş İlanları" sayfamızdan güncel iş ilanlarını takip edebilirsin.',
                        style:
                            TextStyle(color: Color(0xFF3D3F54), fontSize: 17)),
                  )
                ],
              ),
              ExpansionTile(
                title: Text('Size nasıl ulaşabilirim?',
                    style: TextStyle(color: Color(0xFF3D3F54), fontSize: 23)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Bizlere sorunuz veya öneriniz varsa; wisepathh@gmail.com adresi üzerinden ulaşabilirsiniz.',
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
