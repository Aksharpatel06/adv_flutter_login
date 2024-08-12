// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class UserSarvice {
//   static UserSarvice userSarvice = UserSarvice._();
//
//   UserSarvice._();
//
//   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//
//   Future<void> addUser() async {
//     final CollectionReference collectionReference =
//         firebaseFirestore.collection("users");
//     Map<String,dynamic> data = {
//       'name':'Akshar patel',
//       'email':'akshar@gmail.com',
//       'phone':'+91 98654 32151'
//     };
//     await collectionReference.add(data);
//     // await collectionReference.doc(
//     //   //document name
//     // ).set(data);
//   }
//
//
//   Stream<QuerySnapshot<Object?>> getUser()
//   {
//     Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance.collection('users').snapshots();
//     return collectionStream;
//   }
// }
