abstract class DatabaseService {
  // Function add User Data
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? userId,
  });

  // Function get User Data
  Future<Map<String, dynamic>> getData({
    required String path,
    required String userId,
  });

  // Function check if data exists
  Future<bool> checkIfDataExists({
    required String path,
    required String userId,
  });
}
