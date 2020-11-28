import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qolbuyim/models/product.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection("products");

  //
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strenght': strength,
    });
  }

  // brew List from snapshot
  List<Product> _brewListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.documents.map((doc) {
      return Product(
          name: doc.data['name'] ?? '',
          image: doc.data['image'] ?? '0',
          price: doc.data['price'] ?? 0);
    }).toList();
  }

  //user data from Snapshot
//  UserData _userDataFromSnapshot(DocumentSnapshot documentSnapshot) {
//    return UserData(
//      uid: uid,
//      name: documentSnapshot.data['name'],
//      strenght: documentSnapshot.data['strenght'],
//      sugars: documentSnapshot.data['sugars'],
//    );
//  }

// get brews stream
  Stream<List<Product>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //get user doc stream
//  Stream<UserData> get userData {
//    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
//  }
}
