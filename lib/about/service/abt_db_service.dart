import 'package:cloud_firestore/cloud_firestore.dart';

class AboutImage {
  String id;
  String imgurl;

  AboutImage({required this.id, required this.imgurl});
}

class AbtDBService {
  String uid;
  AbtDBService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('about images');

  AboutImage _userDat(DocumentSnapshot snapshot) {
    return AboutImage(id: snapshot['id'], imgurl: snapshot['img']);
  }

  List<AboutImage> _uselist(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      // log(e.data().toString());
      return AboutImage(
        id: e['id'] ?? '',
        imgurl: e['img'] ?? '',
      );
    }).toList();
  }

  Stream<List<AboutImage>>? get user {
    return userCollection.snapshots().map(_uselist);
  }

  Stream<AboutImage> get userData {
    return userCollection.doc(uid).snapshots().map((_userDat));
  }
}
