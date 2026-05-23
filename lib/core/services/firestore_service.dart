import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_app/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  // Function add User Data to Firestore
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? userId,
  }) async {
    if (userId != null) {
      firestore.collection(path).doc(userId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  // Function get User Data from Firestore
  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String userId,
  }) async {
    var data = await firestore.collection(path).doc(userId).get();
    return data.data() as Map<String, dynamic>;
  }

  // Function check if data exists in Firestore
  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String userId,
  }) async {
    var data = await firestore.collection(path).doc(userId).get();
    return data.exists;
  }
}
