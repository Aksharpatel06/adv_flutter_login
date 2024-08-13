import 'package:adv_flutter_login/view/modal/details_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserSarvice {
  static UserSarvice userSarvice = UserSarvice._();

  UserSarvice._();

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Future<void> addUser(Map data) async {
  //   final CollectionReference collectionReference =
  //       firebaseFirestore.collection("users");
  //   // Map<String,dynamic> data = {
  //   //   'name':'Akshar patel',
  //   //   'email':'akshar@gmail.com',
  //   //   'phone':'+91 98654 32151'
  //   // };
  //   // await collectionReference.add(data);
  //   await collectionReference.doc(
  //     data['email']
  //   ).set(data);
  // }
  Future<void> addUser(DetailsModal details)
  async {
    CollectionReference user = firebaseFirestore.collection('user');
    await user.doc(details.email).set(details.objectToMap(details));
  }


  Stream<QuerySnapshot<Object?>> getUser()
  {
    Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance.collection('users').snapshots();
    return collectionStream;
  }

  DocumentReference<Object?> cureentUser(DetailsModal details)
  {
    CollectionReference user= firebaseFirestore.collection('user');
    return user.doc(details.email);
  }
}
