import 'package:b2b_services/app/common/firebase/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  // just a simple get
  static Future<List<Car>> getAllEntries(String collection) async {
    return (await FirebaseFirestore.instance.collection(collection).get())
        .docs
        .map((item) => Car.fromMap(item.data()))
        .toList();

  }

  // get with custom order
  static Future<List<Car>> getAllEntriesSortedByName(String collection) async {
    return (await FirebaseFirestore.instance
            .collection(collection)
            .orderBy("manufacturer", descending: false)
            .get())
        .docs
        .map((item) => Car.fromMap(item.data()))
        .toList();
  }

  // get with filter
  static Future<List<Car>> getAllEntriesFilteredByPrice(
      String collection) async {
    return (await FirebaseFirestore.instance
            .collection(collection)
            .where("price", isGreaterThan: 60000)
            .get())
        .docs
        .map((item) => Car.fromMap(item.data()))
        .toList();
  }

  static Future addEntryWithAutogeneratedId(
      String collection, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance.collection(collection).add(data);
  }

  // updates an existing entry (missing fields won't be touched on update), document must exist
  static Future updateEntryWithId(
      String collection, String documentId, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .update(data);
  }

  // adds or updates an existing entry (missing fields will be deleted on update!), document will be created if needed
  static Future addOrUpdateWithId(
      String collection, String documentId, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .set(data);
  }

  // deletes the entry with the given document id
  static Future deleteEntry(String collection, String documentId) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .delete();
  }
}