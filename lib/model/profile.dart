import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDatas {
  final String name;
  final String surname;
  final String role;
  final String email;

  UserDatas({
    required this.name,
    required this.surname,
    required this.role,
    required this.email,
  });
}
final _userID = FirebaseAuth.instance.currentUser!.uid;
Future<UserDatas?> getUserData(_userID) async {
  //final _userID = FirebaseAuth.instance.currentUser!.uid;
  DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
      .collection('Users')
      .doc(_userID)
      .get();

  if (snapshot.exists) {
    var userData = snapshot.data();
    if (userData != null &&
        userData.containsKey('Name') &&
        userData.containsKey('Surname') &&
        userData.containsKey('Role') &&
        userData.containsKey('email')) {
      String name = userData['Name'];
      String surname = userData['Surname'];
      String role = userData['Role'];
      String email = userData['email'];

      return UserDatas(
        name: name,
        surname: surname,
        role: role,
        email: email,
      );
    }
  }

  return null;
}
