import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName;

  FirestoreService(this.collectionName);

  Future<void> addData(Map<String, dynamic> data) async {
    await _firestore.collection(collectionName).add(data);
  }

  Future<void> updateData(String docId, Map<String, dynamic> data) async {
    await _firestore.collection(collectionName).doc(docId).update(data);
  }

  Future<void> deleteData(String docId) async {
    await _firestore.collection(collectionName).doc(docId).delete();
  }

  Future<List<QueryDocumentSnapshot<Object?>>?> getDataByUser(
      String userId) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection(collectionName)
        .where('userId', isEqualTo: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.toList();
    }
    return null;
  }
}
