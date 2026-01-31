import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServicesClass {
  final firestore = FirebaseFirestore.instance;
  late final usersCollection = firestore.collection("users");

  // Future<void> addUser(String name, int age) async {
  //   await usersCollection.add({'name': name, 'age': age});
  // }

  Future<void> addUser2({
    required String docID,
    required Map<String, dynamic> userData,
  }) async {
    await usersCollection.doc(docID).set(userData);
  }

  Future<QuerySnapshot> getUsers() async {
    return await usersCollection.get();
  }

  Future<Map<String, dynamic>?> getUserById(String docId) async {
    DocumentSnapshot docSnapshot = await usersCollection.doc(docId).get();
    if (docSnapshot.exists) {
      return docSnapshot.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  Future<void> updateUser(String docId, Map<String, dynamic> userData) async {
    await usersCollection.doc(docId).update(userData);
  }

  Future<void> updateUserUsingSet(
    String docId,
    Map<String, dynamic> userData,
  ) async {
    await usersCollection.doc(docId).set(userData, SetOptions(merge: true));
  }

  Future<void> deleteUser(String docId) async {
    await usersCollection.doc(docId).delete();
  }
}
