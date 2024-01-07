import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:homechef_v3/models/homemaker_model.dart';
import 'package:homechef_v3/repository/homemaker/base_homemaker_repository.dart';

class HomemakerRepository extends BaseHomemakerRepository {
  final FirebaseFirestore _firebaseFirestore;
  HomemakerRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Homemaker>> getHomemaker() {
    return _firebaseFirestore
        .collection('restaurants')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Homemaker.fromSnapshot(doc)).toList();
    });
  }
}
