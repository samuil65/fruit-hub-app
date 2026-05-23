import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_app/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(String path, Map<String, dynamic> data) async {
    await firestore.collection(path).add(data);
  }
}
