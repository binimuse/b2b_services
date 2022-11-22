import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabase {
  static void write({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    try {
      DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref("users/$userId");

      await databaseReference.set(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> read({required String userId}) async {
    try {
      DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref("users/$userId");
      final snapshot = await databaseReference.get();
      if (snapshot.exists) {
        Map<String, dynamic> snapshotValue =
            Map<String, dynamic>.from(snapshot.value as Map);
        return snapshotValue['name'] ?? '';
      } else {
        return '';
      }
    } catch (e) {
      rethrow;
    }
  }
}
